using System.Text.Json.Serialization;

namespace TopStoriesServer.Models
{
	public class TopStories
	{
		public int Id { get; set; }
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
		public string ShortUrl { get; set; }
		public DateTime FetchedAt { get; set; }
	}

	public class Multimedia
	{
		public int Id { get; set; }
		public int StoryId { get; set; }
		public string Url { get; set; }
		public string Format { get; set; }
		public int Height { get; set; }
		public int Width { get; set; }
		public string Type { get; set; }
		public string Subtype { get; set; }
		public string Caption { get; set; }
		public string Copyright { get; set; }
	}

	public class NYTimesResponse
	{
		[JsonPropertyName("status")]
		public string Status { get; set; }

		[JsonPropertyName("copyright")]
		public string Copyright { get; set; }

		[JsonPropertyName("section")]
		public string Section { get; set; }

		[JsonPropertyName("last_updated")]
		public DateTime LastUpdated { get; set; }

		[JsonPropertyName("num_results")]
		public int NumResults { get; set; }

		[JsonPropertyName("results")]
		public List<NYTimesStory> Results { get; set; }
	}

	public class NYTimesStory
	{
		[JsonPropertyName("section")]
		public string Section { get; set; }

		[JsonPropertyName("subsection")]
		public string Subsection { get; set; }

		[JsonPropertyName("title")]
		public string Title { get; set; }

		[JsonPropertyName("abstract")]
		public string Abstract { get; set; }

		[JsonPropertyName("url")]
		public string Url { get; set; }

		[JsonPropertyName("uri")]
		public string Uri { get; set; }

		[JsonPropertyName("byline")]
		public string Byline { get; set; }

		[JsonPropertyName("item_type")]
		public string ItemType { get; set; }

		[JsonPropertyName("updated_date")]
		public DateTime UpdatedDate { get; set; }

		[JsonPropertyName("created_date")]
		public DateTime CreatedDate { get; set; }

		[JsonPropertyName("published_date")]
		public DateTime PublishedDate { get; set; }

		[JsonPropertyName("material_type_facet")]
		public string MaterialTypeFacet { get; set; }

		[JsonPropertyName("kicker")]
		public string Kicker { get; set; }

		[JsonPropertyName("short_url")]
		public string ShortUrl { get; set; }

		[JsonPropertyName("multimedia")]
		public List<NYTimesMultimedia> Multimedia { get; set; }
	}

	public class NYTimesMultimedia
	{
		[JsonPropertyName("url")]
		public string Url { get; set; }

		[JsonPropertyName("format")]
		public string Format { get; set; }

		[JsonPropertyName("height")]
		public int Height { get; set; }

		[JsonPropertyName("width")]
		public int Width { get; set; }

		[JsonPropertyName("type")]
		public string Type { get; set; }

		[JsonPropertyName("subtype")]
		public string Subtype { get; set; }

		[JsonPropertyName("caption")]
		public string Caption { get; set; }

		[JsonPropertyName("copyright")]
		public string Copyright { get; set; }
	}
}
