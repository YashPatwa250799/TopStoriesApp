using TopStoriesServer.Common;
using TopStoriesServer.Dtos.ResponseDtos;

namespace TopStoriesServer.Interfaces
{
	public interface ITopStoriesService
	{
		Task<ApiResponse<List<TopStoriesResponse>>> FetchAndStoreTopStoriesAsync(string apiKey);
		Task<ApiResponse<List<TopStoriesResponse>>> GetTopStoriesAsync();
		Task<ApiResponse<TopStoriesResponse>> GetTopStoryByIdAsync(int id);
	}
}
