using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using TopStoriesServer.Common;
using static TopStoriesServer.Common.ApiMessages;

namespace TopStoriesServer.Filters
{
	public class ApiExceptionFilter
	{
		public void OnException(ExceptionContext context)
		{
			var response = new ApiResponse<string>(
				message: ApiMessages.InternalServerError(context.Exception.Message),
				statusCode: (int)ApiStatusCodes.InternalServerError,
				count: 0);

			context.Result = new JsonResult(response)
			{
				StatusCode = (int)ApiStatusCodes.InternalServerError
			};

			context.ExceptionHandled = true;
		}
	}
}
