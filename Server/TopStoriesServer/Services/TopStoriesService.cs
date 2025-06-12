using System.Text.Json;
using TopStoriesServer.Common;
using TopStoriesServer.Dtos.ResponseDtos;
using TopStoriesServer.Interfaces;
using TopStoriesServer.Models;

namespace TopStoriesServer.Services
{
	public class TopStoriesService : ITopStoriesService
	{
		private readonly ITopStoriesRepository _topStoriesRepository;
		private readonly HttpClient _httpClient;
		private const string TopStoryApiUrl = "https://api.nytimes.com/svc/topstories/v2/home.json";
		public TopStoriesService(ITopStoriesRepository topStoriesRepository, HttpClient httpClient)
		{
			_topStoriesRepository = topStoriesRepository;
			_httpClient = httpClient;
		}

		public async Task<ApiResponse<List<TopStoriesResponse>>> FetchAndStoreTopStoriesAsync(string apiKey)
		{
			try
			{
				var url = $"{TopStoryApiUrl}?api-key={apiKey}";
				var response = await _httpClient.GetAsync(url);

				if (!response.IsSuccessStatusCode)
				{
					if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
					{
						return new ApiResponse<List<TopStoriesResponse>>
						{
							Success = false,
							Message = "Invalid API key. Please check your NY Times API key.",
							Data = null,
							Count = 0,
							StatusCode = 200
						};
					}

					return new ApiResponse<List<TopStoriesResponse>>
					{
						Success = false,
						Message = $"Failed to fetch data from NY Times: {response.StatusCode}",
						Data = null
					};
				}

				var jsonContent = await response.Content.ReadAsStringAsync();
				var nyTimesResponse = JsonSerializer.Deserialize<NYTimesResponse>(jsonContent);

				if (nyTimesResponse?.Results == null || !nyTimesResponse.Results.Any())
				{
					return new ApiResponse<List<TopStoriesResponse>>
					{
						Success = false,
						Message = "No stories found in the response.",
						Data = null
					};
				}

				var storedStories = new List<TopStoriesResponse>();
				var newStoriesCount = 0;

				foreach (var nyStory in nyTimesResponse.Results)
				{
					// Check if story already exists
					if (await _topStoriesRepository.TopStoryExistsAsync(nyStory.Uri))
					{
						continue;
					}

					var story = new TopStories
					{
						Section = nyStory.Section,
						Subsection = nyStory.Subsection,
						Title = nyStory.Title,
						Abstract = nyStory.Abstract,
						Url = nyStory.Url,
						Uri = nyStory.Uri,
						Byline = nyStory.Byline,
						ItemType = nyStory.ItemType,
						UpdatedDate = nyStory.UpdatedDate,
						CreatedDate = nyStory.CreatedDate,
						PublishedDate = nyStory.PublishedDate,
						MaterialTypeFacet = nyStory.MaterialTypeFacet,
						Kicker = nyStory.Kicker,
						ShortUrl = nyStory.ShortUrl,
						FetchedAt = DateTime.UtcNow
					};

					var storyId = await _topStoriesRepository.InsertTopStoryAsync(story);
					story.Id = storyId;
					newStoriesCount++;

					// Insert multimedia
					if (nyStory.Multimedia != null && nyStory.Multimedia.Any())
					{
						foreach (var nyMultimedia in nyStory.Multimedia)
						{
							var multimedia = new Multimedia
							{
								StoryId = storyId,
								Url = nyMultimedia.Url,
								Format = nyMultimedia.Format,
								Height = nyMultimedia.Height,
								Width = nyMultimedia.Width,
								Type = nyMultimedia.Type,
								Subtype = nyMultimedia.Subtype,
								Caption = nyMultimedia.Caption,
								Copyright = nyMultimedia.Copyright
							};

							await _topStoriesRepository.InsertMultimediaAsync(multimedia);
						}
					}

					storedStories.Add(MapToStoryDto(story));
				}

				return new ApiResponse<List<TopStoriesResponse>>
				{
					Success = true,
					Message = $"Successfully fetched and stored {newStoriesCount} new stories.",
					Data = storedStories,
					Count = newStoriesCount
				};
			}
			catch (Exception ex)
			{
				//_logger.LogError(ex, "Error fetching and storing stories");
				return new ApiResponse<List<TopStoriesResponse>>
				{
					Success = false,
					Message = $"An error occurred: {ex.Message}",
					Data = null
				};
			}
		}

		public async Task<ApiResponse<List<TopStoriesResponse>>> GetTopStoriesAsync()
		{
			try
			{
				var stories = await _topStoriesRepository.GetAllTopStoriesAsync();
				var storyDtos = new List<TopStoriesResponse>();

				foreach (var story in stories)
				{
					var storyDto = MapToStoryDto(story);
					var multimedia = await _topStoriesRepository.GetMultimediaByTopStoryIdAsync(story.Id);
					storyDto.Multimedia = multimedia.Select(m => new MultimediaDto
					{
						Id = m.Id,
						Url = m.Url,
						Format = m.Format,
						Type = m.Type,
						Caption = m.Caption
					}).ToList();

					storyDtos.Add(storyDto);
				}

				return new ApiResponse<List<TopStoriesResponse>>
				{
					Success = true,
					Message = "Stories retrieved successfully.",
					Data = storyDtos,
					Count = storyDtos.Count
				};
			}
			catch (Exception ex)
			{
				//_logger.LogError(ex, "Error retrieving stories");
				return new ApiResponse<List<TopStoriesResponse>>
				{
					Success = false,
					Message = $"An error occurred: {ex.Message}",
					Data = null
				};
			}
		}

		public async Task<ApiResponse<TopStoriesResponse>> GetTopStoryByIdAsync(int id)
		{
			try
			{
				var story = await _topStoriesRepository.GetTopStoryByIdAsync(id);
				if (story == null)
				{
					return new ApiResponse<TopStoriesResponse>
					{
						Success = false,
						Message = "Story not found.",
						Data = null
					};
				}

				var storyDto = MapToStoryDto(story);
				var multimedia = await _topStoriesRepository.GetMultimediaByTopStoryIdAsync(story.Id);
				storyDto.Multimedia = multimedia.Select(m => new MultimediaDto
				{
					Id = m.Id,
					Url = m.Url,
					Format = m.Format,
					Type = m.Type,
					Caption = m.Caption
				}).ToList();

				return new ApiResponse<TopStoriesResponse>
				{
					Success = true,
					Message = "Story retrieved successfully.",
					Data = storyDto
				};
			}
			catch (Exception ex)
			{
				//_logger.LogError(ex, "Error retrieving story by id");
				return new ApiResponse<TopStoriesResponse>
				{
					Success = false,
					Message = $"An error occurred: {ex.Message}",
					Data = null
				};
			}
		}

		private static TopStoriesResponse MapToStoryDto(TopStories story)
		{
			return new TopStoriesResponse
			{
				Id = story.Id,
				Section = story.Section,
				Subsection = story.Subsection,
				Title = story.Title,
				Abstract = story.Abstract,
				Url = story.Url,
				Byline = story.Byline,
				PublishedDate = story.PublishedDate,
				FetchedAt = story.FetchedAt
			};
		}
	}
}
