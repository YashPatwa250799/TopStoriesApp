using System.Text.RegularExpressions;

namespace TopStoryServerV1.Utilities
{
	public static class UtilityHelper
	{
		public static bool IsValidApiKey(string apiKey)
		{
			var regex = new Regex(@"[a-zA-Z0-9]{32}$");
			return !string.IsNullOrWhiteSpace(apiKey) && regex.IsMatch(apiKey);
		}
	}
}
