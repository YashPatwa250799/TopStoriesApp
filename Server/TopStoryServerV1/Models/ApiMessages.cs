namespace TopStoryServerV1.Models
{
	public static class ApiMessages
	{
		public const string InvalidRequest = "Invalid Request";
		public const string UnexpectedError = "An unexpected error occur";
		public const string RecordNotFound = "Record not found";
		public static class Article
		{
			public const string ApiKeyRequired = "API key is required";
			public const string ApiKeyNotValid = "API key is Not Valid";

			public const string ArticleFetchAndSave = "Article fetch and saved successfully";
			public const string FailedToFetchArticleData = "Failed to fetch Article Data";
			public const string NoResponseFromNYAPI = "No articles found in NY Times API response";
			public const string ArticlesRetrievedSuccessfully = "Articles Retrieved successfully";

			public const string ErrorInGetArticles = "Error in retrieving articles";

			public const string ExceptionWhileFetchingAndSaveArticles = "Error occurred while fetching and saving articles";
			public const string ExceptionWhileGettingArticles = "Error occurred while getting articles";
			public const string ExceptionWhileFetchingDataFromNYAPI = "Error occurred while fetching data from NY Times API";
		}
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
