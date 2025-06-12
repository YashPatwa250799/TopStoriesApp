using TopStoryServerV1.Models;

namespace TopStoryServerV1.Interfaces
{
	public interface INYTimesApiRepository
	{
		Task<NYTimesResponse> GetTopStoriesAsync(string apiKey);
	}
}
