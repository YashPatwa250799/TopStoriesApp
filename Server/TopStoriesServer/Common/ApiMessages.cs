namespace TopStoriesServer.Common
{
	public class ApiMessages
	{
		public static string InternalServerError(string error) => $"Internal server error: {error}.";
		public const string RecordNotFound = "Record not found.";
		public const string InvalidRequest = "Invalid Request.";

		public static class TopStories
		{

		}

		public static class ApiStatusCodes
		{
			public const int Success = 200;
			public const int Created = 201;
			public const int NoContent = 204;
			public const int BadRequest = 400;
			public const int Unauthorized = 401;
			public const int Forbidden = 403;
			public const int NotFound = 404;
			public const int InternalServerError = 500;
		}

	}
}
