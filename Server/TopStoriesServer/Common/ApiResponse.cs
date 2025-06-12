namespace TopStoriesServer.Common
{
	public class ApiResponse<T>
	{
		public bool Success { get; set; }
		public string Message { get; set; }
		public T? Data { get; set; }
		public int StatusCode { get; set; }
		public int Count { get; set; }

		public ApiResponse(T? data, string message, int statusCode, int count)
		{
			Data = data;
			Message = message;
			StatusCode = statusCode;
			Success = statusCode >= 200 && statusCode < 300;
			Count = count;
		}

		public ApiResponse(string message, int statusCode, int count)
			: this(default, message, statusCode, count)
		{
		}

		public ApiResponse()
		{
			Success = false;
			Message = string.Empty;
			Data = default(T);
			StatusCode = 500;
			Count = 0;
		}
	}

}
