import http from "../common/http-common";
import { ApiResponse, Article } from "../types";

const _rootUrl: string = process.env.REACT_APP_API_URL ?? "";
const _baseUrl: string = `${_rootUrl}/articles`;


export const ArticleService = {
    fetchAndSaveArticles: async (
        apiKey: string
    ): Promise<ApiResponse<null>> => {
        const response = await http.post<ApiResponse<null>>(`${_baseUrl}/save`, { apiKey });
        return response.data;
    },

    getAllArticles: async (): Promise<ApiResponse<Article[]>> => {
        const response = await http.get<ApiResponse<Article[]>>(`${_baseUrl}`);
        return response.data;
      },
};



