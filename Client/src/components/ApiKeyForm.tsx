import { Loader2, Search } from "lucide-react";
import React from "react";

function ApiKeyForm({
  apiKey,
  setApiKey,
  fetchArticles,
  fetchingArticles,
}: {
  apiKey: string;
  setApiKey: React.Dispatch<React.SetStateAction<string>>;
  fetchArticles: () => Promise<void>;
  fetchingArticles: boolean;
}) {
  return (
    <div className="bg-white rounded-lg shadow-sm p-6 mb-6">
      <h2 className="text-xl font-semibold mb-4">Fetch New Articles</h2>
      <div className="flex gap-4">
        <div className="flex-1">
          <input
            type="text"
            value={apiKey}
            onChange={(e) => setApiKey(e.target.value)}
            placeholder="Enter your API key"
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            disabled={fetchingArticles}
          />
        </div>
        <button
          onClick={fetchArticles}
          disabled={fetchingArticles || !apiKey.trim()}
          className="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:bg-gray-400 disabled:cursor-not-allowed flex items-center gap-2 transition-colors"
        >
          {fetchingArticles ? (
            <>
              <Loader2 className="w-4 h-4 animate-spin" />
              Fetching...
            </>
          ) : (
            <>
              <Search className="w-4 h-4" />
              Fetch Articles
            </>
          )}
        </button>
      </div>
     
    </div>
  );
}

export default ApiKeyForm;
