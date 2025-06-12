using TopStoryServerV1.Models;

namespace TopStoryServerV1.Interfaces
{
	public interface IArticleRepository
	{
		Task<int> SaveArticleAsync(Article article);
		Task<IEnumerable<Article>> GetAllArticlesAsync();
		Task<Article> GetArticleByIdAsync(int id);
		Task SaveMultimediaAsync(int articleId, IEnumerable<Multimedia> multimedia);
		Task SaveFacetsAsync(int articleId, IEnumerable<string> desFacets,
			IEnumerable<string> orgFacets, IEnumerable<string> perFacets,
			IEnumerable<string> geoFacets);
		Task<IEnumerable<Multimedia>> GetMultimediaByArticleIdAsync(int articleId);
		Task<Dictionary<string, IEnumerable<string>>> GetFacetsByArticleIdAsync(int articleId);
		Task<bool> ArticleExistsAsync(string uri);

	}
}
