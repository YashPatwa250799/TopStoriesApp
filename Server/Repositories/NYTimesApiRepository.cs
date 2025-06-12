using System.Text.Json;
using TopStoryServerV1.Interfaces;
using TopStoryServerV1.Models;

namespace TopStoryServerV1.Repositories
{
	public class NYTimesApiRepository : INYTimesApiRepository
	{
		private readonly HttpClient _httpClient;
		private readonly ILogger<NYTimesApiRepository> _logger;

		public NYTimesApiRepository(HttpClient httpClient, ILogger<NYTimesApiRepository> logger)
		{
			_httpClient = httpClient;
			_logger = logger;
		}

		public async Task<NYTimesResponse> GetTopStoriesAsync(string apiKey)
		{
			try
			{
				var url = $"https://api.nytimes.com/svc/topstories/v2/home.json?api-key={apiKey}";
				var response = await _httpClient.GetAsync(url);

				if (response.IsSuccessStatusCode)
				{
					var content = await response.Content.ReadAsStringAsync();
					var options = new JsonSerializerOptions
					{
						PropertyNameCaseInsensitive = true,
						PropertyNamingPolicy = JsonNamingPolicy.SnakeCaseLower
					};

					return JsonSerializer.Deserialize<NYTimesResponse>(content, options);
				}
				else
				{
					_logger.LogError($"{ApiMessages.Article.FailedToFetchArticleData}. Status: {response.StatusCode}");
					throw new HttpRequestException($"{ApiMessages.Article.FailedToFetchArticleData}: {response.StatusCode}");
				}
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, ApiMessages.Article.ExceptionWhileFetchingDataFromNYAPI);
				throw;
			}
		}
	}
}
