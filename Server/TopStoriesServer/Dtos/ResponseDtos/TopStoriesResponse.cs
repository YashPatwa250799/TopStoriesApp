namespace TopStoriesServer.Dtos.ResponseDtos
{
	public class TopStoriesResponse
	{
		public int Id { get; set; }
		public string Section { get; set; }
		public string Subsection { get; set; }
		public string Title { get; set; }
		public string Abstract { get; set; }
		public string Url { get; set; }
		public string Byline { get; set; }
		public DateTime PublishedDate { get; set; }
		public DateTime FetchedAt { get; set; }
		public List<MultimediaDto> Multimedia { get; set; } = new List<MultimediaDto>();
	}

	public class MultimediaDto
	{
		public int Id { get; set; }
		public string Url { get; set; }
		public string Format { get; set; }
		public string Type { get; set; }
		public string Caption { get; set; }
	}


}
