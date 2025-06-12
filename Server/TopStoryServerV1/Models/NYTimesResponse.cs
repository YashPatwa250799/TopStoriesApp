namespace TopStoryServerV1.Models
{
	public class NYTimesResponse
	{
		public string Status { get; set; }
		public string Copyright { get; set; }
		public string Section { get; set; }
		public DateTime LastUpdated { get; set; }
		public int NumResults { get; set; }
		public List<NYTimesArticle> Results { get; set; } = new List<NYTimesArticle>();
	}
	public class NYTimesArticle
	{
		public string Section { get; set; }
		public string Subsection { get; set; }
		public string Title { get; set; }
		public string Abstract { get; set; }
		public string Url { get; set; }
		public string Uri { get; set; }
		public string Byline { get; set; }
		public string ItemType { get; set; }
		public DateTime UpdatedDate { get; set; }
		public DateTime CreatedDate { get; set; }
		public DateTime PublishedDate { get; set; }
		public string MaterialTypeFacet { get; set; }
		public string Kicker { get; set; }
		public List<string> DesFacet { get; set; } = new List<string>();
		public List<string> OrgFacet { get; set; } = new List<string>();
		public List<string> PerFacet { get; set; } = new List<string>();
		public List<string> GeoFacet { get; set; } = new List<string>();
		public List<NYTimesMultimedia> Multimedia { get; set; } = new List<NYTimesMultimedia>();
		public string ShortUrl { get; set; }
	}

	public class NYTimesMultimedia
	{
		public string Url { get; set; }
		public string Format { get; set; }
		public int Height { get; set; }
		public int Width { get; set; }
		public string Type { get; set; }
		public string Subtype { get; set; }
		public string Caption { get; set; }
		public string Copyright { get; set; }
	}
}
