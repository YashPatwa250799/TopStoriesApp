namespace TopStoriesServer.Common
{
	public class PaginationDTO
	{
		public int PageNumber { get; set; }
		public int PageSize { get; set; }
		public int TotalPages { get; set; }
		public int TotalRecords { get; set; }
		public string? SortColumn { get; set; }
		public string SortDirection { get; set; }


		public PaginationDTO(int pageNumber, int pageSize, int totalRecords, string? sortBy, string orderBy)
		{
			PageNumber = pageNumber;
			PageSize = pageSize;
			TotalRecords = totalRecords;
			TotalPages = (int)Math.Ceiling((double)totalRecords / pageSize);
			SortColumn = sortBy;
			SortDirection = orderBy;
		}
	}
}
