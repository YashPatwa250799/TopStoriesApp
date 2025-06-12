namespace TopStoryServerV1.Models
{
	public class ArticleResponse
	{

		public int Id { get; set; }
		public string Section { get; set; }
		public string Subsection { get; set; }
		public string Title { get; set; }
		public string Abstract { get; set; }
		public string Url { get; set; }
		public string Byline { get; set; }
		public string ItemType { get; set; }
		public DateTime? UpdatedDate { get; set; }
		public DateTime? CreatedDate { get; set; }
		public DateTime? PublishedDate { get; set; }
		public DateTime ApiCallTimestamp { get; set; }
		public List<MultimediaResponse> Multimedia { get; set; } = new List<MultimediaResponse>();
		public List<string> DesFacets { get; set; } = new List<string>();
		public List<string> OrgFacets { get; set; } = new List<string>();
		public List<string> PerFacets { get; set; } = new List<string>();
		public List<string> GeoFacets { get; set; } = new List<string>();
	}

	public class MultimediaResponse
	{
		public string Url { get; set; }
		public string Format { get; set; }
		public int Height { get; set; }
		public int Width { get; set; }
		public string Type { get; set; }
		public string Caption { get; set; }
	}
}
