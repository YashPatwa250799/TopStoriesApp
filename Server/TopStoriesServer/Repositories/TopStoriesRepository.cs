using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.Common;
using TopStoriesServer.Interfaces;
using TopStoriesServer.Models;

namespace TopStoriesServer.Repositories
{
	public class TopStoriesRepository : ITopStoriesRepository
	{
		private readonly IDbConnection _dbConnection;
		public TopStoriesRepository(IDbConnection dbConnection)
		{
			_dbConnection = dbConnection;
		}

		public async Task<int> InsertTopStoryAsync(TopStories story)
		{
			var sql = @"
                INSERT INTO Stories (Section, Subsection, Title, Abstract, Url, Uri, Byline, 
                                   ItemType, UpdatedDate, CreatedDate, PublishedDate, 
                                   MaterialTypeFacet, Kicker, ShortUrl, FetchedAt)
                VALUES (@Section, @Subsection, @Title, @Abstract, @Url, @Uri, @Byline, 
                        @ItemType, @UpdatedDate, @CreatedDate, @PublishedDate, 
                        @MaterialTypeFacet, @Kicker, @ShortUrl, @FetchedAt);
                SELECT CAST(SCOPE_IDENTITY() as int);";

			return await _dbConnection.QuerySingleAsync<int>(sql, story);
		}

		public async Task<bool> InsertMultimediaAsync(Multimedia multimedia)
		{
			var sql = @"
                INSERT INTO Multimedia (StoryId, Url, Format, Height, Width, Type, Subtype, Caption, Copyright)
                VALUES (@StoryId, @Url, @Format, @Height, @Width, @Type, @Subtype, @Caption, @Copyright)";

			var result = await _dbConnection.ExecuteAsync(sql, multimedia);
			return result > 0;
		}

		public async Task<IEnumerable<TopStories>> GetAllTopStoriesAsync()
		{
			var sql = "SELECT * FROM Stories ORDER BY PublishedDate DESC";
			return await _dbConnection.QueryAsync<TopStories>(sql);
		}

		public async Task<TopStories> GetTopStoryByIdAsync(int id)
		{
			var sql = "SELECT * FROM Stories WHERE Id = @Id";
			return await _dbConnection.QuerySingleOrDefaultAsync<TopStories>(sql, new { Id = id });
		}

		public async Task<IEnumerable<Multimedia>> GetMultimediaByTopStoryIdAsync(int storyId)
		{
			var sql = "SELECT * FROM Multimedia WHERE StoryId = @StoryId";
			return await _dbConnection.QueryAsync<Multimedia>(sql, new { StoryId = storyId });
		}

		public async Task<bool> TopStoryExistsAsync(string uri)
		{
			var sql = "SELECT COUNT(1) FROM Stories WHERE Uri = @Uri";
			var count = await _dbConnection.QuerySingleAsync<int>(sql, new { Uri = uri });
			return count > 0;
		}

		public async Task<bool> DeleteAllTopStoriesAsync()
		{
			var sql = @"
                DELETE FROM Multimedia;
                DELETE FROM Stories;";
			var result = await _dbConnection.ExecuteAsync(sql);
			return result >= 0;
		}
	}
}
