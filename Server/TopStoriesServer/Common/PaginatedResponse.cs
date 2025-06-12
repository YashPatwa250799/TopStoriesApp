namespace TopStoriesServer.Common
{
	public class PaginatedResponse<T>
	{
		public IEnumerable<T> Records { get; set; }
		public PaginationDTO Pagination { get; set; }

		public PaginatedResponse(IEnumerable<T> records, int pageNumber, int pageSize, int totalRecords, string? sortBy, string orderBy)
		{
			Records = records ?? Enumerable.Empty<T>();
			Pagination = new PaginationDTO(pageNumber, pageSize, totalRecords, sortBy, orderBy);
		}
	}
}
