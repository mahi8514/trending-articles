//
//  ArticleStore.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//


enum ArticleTargetType: TargetType {
    
    case articles(days: Int)
    
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return APIConfig.baseUrl
    }
    
    var path: String {
        switch self {
        case .articles(let days):
            return "/svc/mostpopular/v2/viewed/\(days).json"
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
    func articles(days: Int) async throws -> ArticleResponse
}

final class ArticleStoreImpl: APIClient<ArticleTargetType>, ArticleStore {
    
    func articles(days: Int) async throws -> ArticleResponse {
        try await request(target: .articles(days: days))
    }
    
}
