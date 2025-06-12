using TopStoriesServer.Models;

namespace TopStoriesServer.Interfaces
{
	public interface ITopStoriesRepository
	{
		Task<int> InsertTopStoryAsync(TopStories story);
		Task<bool> InsertMultimediaAsync(Multimedia multimedia);
		Task<IEnumerable<TopStories>> GetAllTopStoriesAsync();
		Task<TopStories> GetTopStoryByIdAsync(int id);
		Task<IEnumerable<Multimedia>> GetMultimediaByTopStoryIdAsync(int storyId);
		Task<bool> TopStoryExistsAsync(string uri);
		Task<bool> DeleteAllTopStoriesAsync();
	}
}
