using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TopStoryServerV1.Interfaces;
using TopStoryServerV1.Models;
using TopStoryServerV1.Utilities;

namespace TopStoryServerV1.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ArticlesController : ControllerBase
	{
		private readonly IArticleService _articleService;
		private readonly ILogger<ArticlesController> _logger;

		public ArticlesController(IArticleService articleService, ILogger<ArticlesController> logger)
		{
			_articleService = articleService;
			_logger = logger;
		}

		/// <summary>
		/// Fetch articles from NY Times API and insert into database
		/// </summary>
		/// <param name="request">Accept API key</param>
		/// <returns>Success status</returns>
		[HttpPost("save")]
		public async Task<IActionResult> FetchAndSaveArticles([FromBody] ApiKeyRequest request)
		{
			try
			{
				if (!UtilityHelper.IsValidApiKey(request.ApiKey))
				{
					return BadRequest(new ApiResponse<string>(ApiMessages.Article.ApiKeyNotValid, ApiStatusCodes.BadRequest));
				}

				var success = await _articleService.FetchAndSaveArticlesAsync(request.ApiKey);

				if (success)
				{
					return Ok(new ApiResponse<string>(ApiMessages.Article.ArticleFetchAndSave, ApiStatusCodes.Success));
				}
				else
				{
					return BadRequest(new ApiResponse<string>(ApiMessages.Article.FailedToFetchArticleData, ApiStatusCodes.BadRequest));
				}
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, ApiMessages.Article.ExceptionWhileFetchingAndSaveArticles);
				return BadRequest(new ApiResponse<string>(ApiMessages.UnexpectedError, ApiStatusCodes.InternalServerError));
			}
		}

		/// <summary>
		/// Get all articles
		/// </summary>
		/// <returns>List of articles</returns>
		[HttpGet]
		public async Task<IActionResult> GetAllArticles()
		{
			try
			{
				var articles = await _articleService.GetAllArticlesAsync();

				return (articles == null || !articles.Any())
					? NotFound(new ApiResponse<IEnumerable<ArticleResponse>>(ApiMessages.RecordNotFound, ApiStatusCodes.NotFound))
					: Ok(new ApiResponse<IEnumerable<ArticleResponse>>(articles, ApiMessages.Article.ArticlesRetrievedSuccessfully, ApiStatusCodes.Success));
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, ApiMessages.Article.ExceptionWhileGettingArticles);
				return StatusCode(500, new ApiResponse<string>(ApiMessages.Article.ExceptionWhileGettingArticles, ApiStatusCodes.InternalServerError));
			}
		}

	}
}
