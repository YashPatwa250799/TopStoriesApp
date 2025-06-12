using TopStoryServerV1.Interfaces;
using TopStoryServerV1.Models;

namespace TopStoryServerV1.Services
{
	public class ArticleService : IArticleService
	{
		private readonly IArticleRepository _articleRepository;
		private readonly INYTimesApiRepository _nyTimesApiRepository;
		private readonly ILogger<ArticleService> _logger;

		public ArticleService(
			IArticleRepository articleRepository,
			INYTimesApiRepository nyTimesApiRepository,
			ILogger<ArticleService> logger)
		{
			_articleRepository = articleRepository;
			_nyTimesApiRepository = nyTimesApiRepository;
			_logger = logger;
		}

		public async Task<bool> FetchAndSaveArticlesAsync(string apiKey)
		{
			try
			{
				var nyTimesResponse = await _nyTimesApiRepository.GetTopStoriesAsync(apiKey);

				if (nyTimesResponse?.Results == null || !nyTimesResponse.Results.Any())
				{
					_logger.LogWarning(ApiMessages.Article.NoResponseFromNYAPI);
					return false;
				}

				foreach (var nyTimesArticleItem in nyTimesResponse.Results)
				{
					if (await _articleRepository.ArticleExistsAsync(nyTimesArticleItem.Uri))
					{
						continue;
					}
					var article = new Article
					{
						Section = nyTimesArticleItem.Section,
						Subsection = nyTimesArticleItem.Subsection,
						Title = nyTimesArticleItem.Title,
						Abstract = nyTimesArticleItem.Abstract,
						Url = nyTimesArticleItem.Url,
						Uri = nyTimesArticleItem.Uri,
						Byline = nyTimesArticleItem.Byline,
						ItemType = nyTimesArticleItem.ItemType,
						UpdatedDate = nyTimesArticleItem.UpdatedDate,
						CreatedDate = nyTimesArticleItem.CreatedDate,
						PublishedDate = nyTimesArticleItem.PublishedDate,
						MaterialTypeFacet = nyTimesArticleItem.MaterialTypeFacet,
						Kicker = nyTimesArticleItem.Kicker,
						ShortUrl = nyTimesArticleItem.ShortUrl
					};

					var articleId = await _articleRepository.SaveArticleAsync(article);

					if (nyTimesArticleItem.Multimedia?.Any() == true)
					{
						var multimedia = nyTimesArticleItem.Multimedia.Select(m => new Multimedia
						{
							Url = m.Url,
							Format = m.Format,
							Height = m.Height,
							Width = m.Width,
							Type = m.Type,
							Subtype = m.Subtype,
							Caption = m.Caption,
							Copyright = m.Copyright
						});

						await _articleRepository.SaveMultimediaAsync(articleId, multimedia);
					}

					await _articleRepository.SaveFacetsAsync(articleId,
						nyTimesArticleItem.DesFacet,
						nyTimesArticleItem.OrgFacet,
						nyTimesArticleItem.PerFacet,
						nyTimesArticleItem.GeoFacet);
				}
				return true;
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, ApiMessages.Article.ExceptionWhileFetchingAndSaveArticles);
				return false;
			}
		}

		public async Task<IEnumerable<ArticleResponse>> GetAllArticlesAsync()
		{
			try
			{
				var articles = await _articleRepository.GetAllArticlesAsync();

				return articles.Select(article => new ArticleResponse
				{
					Id = article.Id,
					Section = article.Section,
					Subsection = article.Subsection,
					Title = article.Title,
					Abstract = article.Abstract,
					Url = article.Url,
					Byline = article.Byline,
					ItemType = article.ItemType,
					UpdatedDate = article.UpdatedDate,
					CreatedDate = article.CreatedDate,
					PublishedDate = article.PublishedDate,
					ApiCallTimestamp = article.ApiCallTimestamp,
					Multimedia = article.Multimedia?.Select(m => new MultimediaResponse
					{
						Url = m.Url,
						Format = m.Format,
						Height = m.Height,
						Width = m.Width,
						Type = m.Type,
						Caption = m.Caption
					}).ToList() ?? new List<MultimediaResponse>(),
					DesFacets = article.DesFacets ?? new List<string>(),
					OrgFacets = article.OrgFacets ?? new List<string>(),
					PerFacets = article.PerFacets ?? new List<string>(),
					GeoFacets = article.PerFacets ?? new List<string>()
				});
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, ApiMessages.Article.ExceptionWhileGettingArticles);
				throw;
			}
		}
	}
}
