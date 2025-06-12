using TopStoryServerV1.Models;

namespace TopStoryServerV1.Interfaces
{
	public interface IArticleService
	{
		Task<bool> FetchAndSaveArticlesAsync(string apiKey);
		Task<IEnumerable<ArticleResponse>> GetAllArticlesAsync();
	}
}
