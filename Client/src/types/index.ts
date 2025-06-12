export interface Article {
    id: number;
    title: string;
    abstract: string;
    byline: string;
    url: string;
    uri: string;
    section: string;
    subsection: string;
    publishedDate: string;
    multimedia?: {
        url: string;
        caption?: string;
    }[];
    desFacets?: string[];
    orgFacets?: string[];
    perFacets?: string[];
    geoFacets?: string[];
}

export interface FetchArticlesResponse {
    success: boolean;
    message?: string;
}

export interface LoadArticlesResponse {
    success: boolean;
    data: Article[];
}

export interface ApiResponse<T> {
    success: boolean;
    message: string;
    data: T;
    statusCode: number;
  }

