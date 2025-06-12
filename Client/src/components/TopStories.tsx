import React, { useState, useEffect } from "react";
import { CheckCircle, AlertCircle } from "lucide-react";
import ApiKeyForm from "./ApiKeyForm";
import ArticlesTable from "./ArticlesTable";
import ArticleModal from "./ArticleModal";
import { Article } from "../types";
import { ArticleService } from "../services/top-story.service";

const TopStories: React.FC = () => {
  const [apiKey, setApiKey] = useState("");
  const [articles, setArticles] = useState<Article[]>([]);
  const [loading, setLoading] = useState(false);
  const [fetchingArticles, setFetchingArticles] = useState(false);
  const [message, setMessage] = useState("");
  const [messageType, setMessageType] = useState<"success" | "error" | "">("");
  const [selectedArticle, setSelectedArticle] = useState<Article | null>(null);
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    loadArticles();
  }, []);

  const showMessage = (text: string, type: "success" | "error") => {
    setMessage(text);
    setMessageType(type);
    setTimeout(() => {
      setMessage("");
      setMessageType("");
    }, 5000);
  };

  const fetchArticles = async () => {
    const trimmedApiKey = apiKey.trim();
    if (!trimmedApiKey) {
      showMessage("Please enter a valid API key", "error");
      return;
    }
    setFetchingArticles(true);

    try {
      const response = await ArticleService.fetchAndSaveArticles(trimmedApiKey);
      if (response?.success) {
        showMessage("Articles fetched and saved successfully!", "success");
        await loadArticles();
        setApiKey("");
      } else {
        showMessage(response?.message || "Failed to fetch articles", "error");
      }
    } catch (error: any) {
      const errorMessage =
        error?.response?.data?.message || "Error connecting to the server";
      showMessage(errorMessage, "error");
    } finally {
      setFetchingArticles(false);
    }
  };
  

  const loadArticles = async () => {
    setLoading(true);
    try {
      const response = await ArticleService.getAllArticles();

      if (response.success) {
        setArticles(response.data || []);
      } else {
        showMessage("Failed to load articles", "error");
      }
    } catch (error: any) {
      const errorMessage =
        error?.response?.data?.message || "Error connecting to the server";
      showMessage(errorMessage, "error");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-white shadow-sm border-b">
        <div className="max-w-7xl mx-auto px-4 py-6">
          <h1 className="text-3xl font-bold text-gray-900">
           Top Stories
          </h1>
          <p className="text-gray-600 mt-2">
            Fetch and browse the latest articles
          </p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 py-6">
        <ApiKeyForm
          apiKey={apiKey}
          setApiKey={setApiKey}
          fetchArticles={fetchArticles}
          fetchingArticles={fetchingArticles}
        />

        {message && (
          <div
            className={`mb-6 p-4 rounded-lg flex items-center gap-2 ${
              messageType === "success"
                ? "bg-green-100 text-green-800 border border-green-200"
                : "bg-red-100 text-red-800 border border-red-200"
            }`}
          >
            {messageType === "success" ? (
              <CheckCircle className="w-5 h-5" />
            ) : (
              <AlertCircle className="w-5 h-5" />
            )}
            {message}
          </div>
        )}

        <ArticlesTable
          articles={articles}
          loading={loading}
          onViewDetails={(article: Article) => {
            setSelectedArticle(article);
            setShowModal(true);
          }}
        />
      </div>

      {showModal && selectedArticle && (
        <ArticleModal
          article={selectedArticle}
          onClose={() => setShowModal(false)}
        />
      )}
    </div>
  );
};

export default TopStories;
