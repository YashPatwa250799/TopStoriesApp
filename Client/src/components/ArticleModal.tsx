import { Calendar, User, Tag, Building, Globe } from "lucide-react";
import { Article } from "../types";
import { formatDate, renderFacets } from "../utils";

function ArticleModal({
  article,
  onClose,
}: {
  article: Article;
  onClose: () => void;
}) {
  return (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
        <div className="bg-white rounded-lg max-w-4xl max-h-[80vh] w-full overflow-y-auto">
          <div className="p-6">
            <div className="flex justify-between items-start mb-4">
              <h2 className="text-2xl mb-4 font-bold text-gray-900 pr-4">
                {article.title}
              </h2>
              <button
                onClick={() => onClose()}
                className="text-black-500 hover:text-red-500 text-4xl font-bold"
              >
                ×
              </button>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
              <div>
                <div className="flex items-center gap-2 text-gray-600 mb-2">
                  <Calendar className="w-4 h-4" />
                  <span className="font-medium">Published:</span>
                  <span>{formatDate(article.publishedDate)}</span>
                </div>
                {article.byline && (
                  <div className="flex items-center gap-2 text-gray-600 mb-2">
                    <User className="w-4 h-4" />
                    <span>{article.byline}</span>
                  </div>
                )}
                <div className="flex items-center gap-2 text-gray-600 mb-2">
                  <Tag className="w-4 h-4" />
                  <span className="px-2 py-1 bg-blue-100 text-blue-800 rounded text-sm">
                    {article.section}
                  </span>
                  {article.subsection && (
                    <span className="px-2 py-1 bg-gray-100 text-gray-800 rounded text-sm">
                      {article.subsection}
                    </span>
                  )}
                </div>
              </div>

              {article.multimedia && article.multimedia.length > 0 && (
                <div>
                  <img
                    src={article.multimedia[0].url}
                    alt={article.multimedia[0].caption || article.title}
                    className="w-full h-48 object-cover rounded-lg"
                  />
                  {article.multimedia[0].caption && (
                    <p className="text-sm text-gray-500 mt-2">
                      {article.multimedia[0].caption}
                    </p>
                  )}
                </div>
              )}
            </div>

            {article.abstract && (
              <div className="mb-6">
                <h3 className="font-semibold text-gray-900 mb-2">Abstract</h3>
                <p className="text-gray-700">{article.abstract}</p>
              </div>
            )}

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              {renderFacets(
                article.desFacets,
                <Tag className="w-4 h-4" />,
                "Topics",
                "purple"
              )}
              {renderFacets(
                article.orgFacets,
                <Building className="w-4 h-4" />,
                "Organizations",
                "green"
              )}
              {renderFacets(
                article.perFacets,
                <User className="w-4 h-4" />,
                "People",
                "blue"
              )}
              {renderFacets(
                article.geoFacets,
                <Globe className="w-4 h-4" />,
                "Locations",
                "red"
              )}
            </div>

            {article.url && (
              <div className="mt-6 pt-6 border-t">
                <a
                  href={article.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                >
                  Read Full Article on NY Times
                </a>
              </div>
            )}
          </div>
        </div>
      </div>
  );
}

export default ArticleModal;
