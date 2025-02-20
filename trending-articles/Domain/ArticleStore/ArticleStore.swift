//
//  ArticleStore.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//


enum ArticleTargetType: TargetType {
    
    case articles(day: Int)
    
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return APIConfig.baseUrl
    }
    
    var path: String {
        switch self {
        case .articles(let day):
            return "/svc/mostpopular/v2/viewed/\(day).json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .articles:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .articles:
            return nil
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .articles:
            return .requestParameters(parameters: parameters)
        }
    }
    
    private var parameters: HTTPParameters {
        var parameters: HTTPParameters = [:]
        switch self {
        case .articles:
            parameters = ["api-key": APIKeys.articleAPIKey]
        }
        return parameters
    }
}

protocol ArticleStore {
    func fetchArticles() -> [Article]
}

final class ArticleStoreImpl: APIClient<ArticleTargetType>, ArticleStore {
    
    func fetchArticles() -> [Article] {
        []
    }
    
}
