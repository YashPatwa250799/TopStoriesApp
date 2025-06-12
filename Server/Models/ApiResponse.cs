namespace TopStoryServerV1.Models
{
	public class ApiResponse<T>
	{
		public bool Success { get; set; }
		public string Message { get; set; }
		public T? Data { get; set; }
		public int StatusCode { get; set; }

		public ApiResponse(T? data, string message, int statusCode)
		{
			Success = statusCode >= 200 && statusCode < 300;
			Data = data;
			Message = message;
			StatusCode = statusCode;
		}

		public ApiResponse(string message, int statusCode)
			: this(default!, message, statusCode)
		{
		}
	}
}
