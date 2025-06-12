using System.Data.SqlClient;
using System.Data;
using TopStoryServerV1.Interfaces;
using TopStoryServerV1.Models;
using Dapper;

namespace TopStoryServerV1.Repositories
{
	public class ArticleRepository : IArticleRepository
	{
		private readonly IDbConnection _dbConnection;

		public ArticleRepository(IDbConnection dbConnection)
		{
			_dbConnection = dbConnection;
		}

		public async Task<int> SaveArticleAsync(Article article)
		{
			try
			{
				var parameters = new DynamicParameters();

				parameters.Add("@Section", article.Section);
				parameters.Add("@Subsection", article.Subsection);
				parameters.Add("@Title", article.Title);
				parameters.Add("@Abstract", article.Abstract);
				parameters.Add("@Url", article.Url);
				parameters.Add("@Uri", article.Uri);
				parameters.Add("@Byline", article.Byline);
				parameters.Add("@ItemType", article.ItemType);
				parameters.Add("@UpdatedDate", article.UpdatedDate);
				parameters.Add("@CreatedDate", article.CreatedDate);
				parameters.Add("@PublishedDate", article.PublishedDate);
				parameters.Add("@MaterialTypeFacet", article.MaterialTypeFacet);
				parameters.Add("@Kicker", article.Kicker);
				parameters.Add("@ShortUrl", article.ShortUrl);
				parameters.Add("@ArticleId", dbType: DbType.Int32, direction: ParameterDirection.Output);

				await _dbConnection.ExecuteAsync("sp_SaveArticle", parameters, commandType: CommandType.StoredProcedure);

				return parameters.Get<int>("@ArticleId");
			}
			catch (Exception ex)
			{

				throw;
			}
			
		}

		public async Task<IEnumerable<Article>> GetAllArticlesAsync()
		{
			var articles = await _dbConnection.QueryAsync<Article>("sp_GetAllArticles", commandType: CommandType.StoredProcedure);

			foreach (var article in articles)
			{
				article.Multimedia = (await GetMultimediaByArticleIdAsync(article.Id)).ToList();
				var facets = await GetFacetsByArticleIdAsync(article.Id);
				article.DesFacets = facets.ContainsKey("des") ? facets["des"].ToList() : new List<string>();
				article.OrgFacets = facets.ContainsKey("org") ? facets["org"].ToList() : new List<string>();
				article.PerFacets = facets.ContainsKey("per") ? facets["per"].ToList() : new List<string>();
				article.GeoFacets = facets.ContainsKey("geo") ? facets["geo"].ToList() : new List<string>();
			}

			return articles;
		}

		public async Task<Article> GetArticleByIdAsync(int id)
		{
			var article = await _dbConnection.QueryFirstOrDefaultAsync<Article>(
				"SELECT * FROM Articles WHERE Id = @Id", new { Id = id });

			if (article != null)
			{
				article.Multimedia = (await GetMultimediaByArticleIdAsync(article.Id)).ToList();
				var facets = await GetFacetsByArticleIdAsync(article.Id);
				article.DesFacets = facets.ContainsKey("des") ? facets["des"].ToList() : new List<string>();
				article.OrgFacets = facets.ContainsKey("org") ? facets["org"].ToList() : new List<string>();
				article.PerFacets = facets.ContainsKey("per") ? facets["per"].ToList() : new List<string>();
				article.GeoFacets = facets.ContainsKey("geo") ? facets["geo"].ToList() : new List<string>();
			}

			return article;
		}

		public async Task SaveMultimediaAsync(int articleId, IEnumerable<Multimedia> multimedia)
		{
			foreach (var media in multimedia)
			{
				var parameters = new DynamicParameters();
				parameters.Add("@ArticleId", articleId);
				parameters.Add("@Url", media.Url);
				parameters.Add("@Format", media.Format);
				parameters.Add("@Height", media.Height);
				parameters.Add("@Width", media.Width);
				parameters.Add("@Type", media.Type);
				parameters.Add("@Subtype", media.Subtype);
				parameters.Add("@Caption", media.Caption);
				parameters.Add("@Copyright", media.Copyright);

				await _dbConnection.ExecuteAsync("sp_SaveMultimedia", parameters, commandType: CommandType.StoredProcedure);
			}
		}

		public async Task SaveFacetsAsync(int articleId, IEnumerable<string> desFacets,
			IEnumerable<string> orgFacets, IEnumerable<string> perFacets, IEnumerable<string> geoFacets)
		{
			foreach (var facet in desFacets ?? Enumerable.Empty<string>())
			{
				await _dbConnection.ExecuteAsync("sp_SaveDesFacet",
					new { ArticleId = articleId, Facet = facet }, commandType: CommandType.StoredProcedure);
			}

			foreach (var facet in orgFacets ?? Enumerable.Empty<string>())
			{
				await _dbConnection.ExecuteAsync("sp_SaveOrgFacet",
					new { ArticleId = articleId, Facet = facet }, commandType: CommandType.StoredProcedure);
			}

			foreach (var facet in perFacets ?? Enumerable.Empty<string>())
			{
				await _dbConnection.ExecuteAsync("sp_SavePerFacet",
					new { ArticleId = articleId, Facet = facet }, commandType: CommandType.StoredProcedure);
			}

			foreach (var facet in geoFacets ?? Enumerable.Empty<string>())
			{
				await _dbConnection.ExecuteAsync("sp_SaveGeoFacet",
					new { ArticleId = articleId, Facet = facet }, commandType: CommandType.StoredProcedure);
			}
		}

		public async Task<IEnumerable<Multimedia>> GetMultimediaByArticleIdAsync(int articleId)
		{
			return await _dbConnection.QueryAsync<Multimedia>("sp_GetMultimediaByArticleId",
				new { ArticleId = articleId }, commandType: CommandType.StoredProcedure);
		}

		public async Task<Dictionary<string, IEnumerable<string>>> GetFacetsByArticleIdAsync(int articleId)
		{
			var facets = await _dbConnection.QueryAsync<dynamic>("sp_GetFacetsByArticleId",
				new { ArticleId = articleId }, commandType: CommandType.StoredProcedure);

			var result = new Dictionary<string, IEnumerable<string>>();

			foreach (var group in facets.GroupBy(f => f.FacetType))
			{
				result[group.Key] = group.Select(f => (string)f.Facet);
			}

			return result;
		}

		public async Task<bool> ArticleExistsAsync(string uri)
		{
			var parameters = new DynamicParameters();
			parameters.Add("@Uri", uri);

			var count = await _dbConnection.QuerySingleAsync<int>(
				"sp_GetCountArticleByUri",
				parameters,
				commandType: CommandType.StoredProcedure);

			return count > 0;
		}
	}
}
