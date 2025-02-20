//
//  ArticleStore.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//

protocol ArticleStore {
    func articles(days: Int) async throws -> ArticleResponse
}

final class ArticleStoreImpl: APIClient<ArticleTargetType>, ArticleStore {
    
    static private var baseUrl: String?
    static private var apiKey: String?
    
    static func activate(baseUrl: String, apiKey: String) {
        self.baseUrl = baseUrl
        self.apiKey = apiKey
    }
    
    static func getBaseUrl() -> String {
        guard let baseUrl else {
            fatalError(storeNotActivatedFatalErrorMessage)
        }
        return baseUrl
    }
    
    static func getAPIKey() -> String {
        guard let apiKey else {
            fatalError(storeNotActivatedFatalErrorMessage)
        }
        return apiKey
    }
    
    func articles(days: Int) async throws -> ArticleResponse {
        try await request(target: .articles(days: days))
    }
    
}

extension ArticleStoreImpl {
    
    static private var storeNotActivatedFatalErrorMessage: String {
        "ArticleStore not activated"
    }
    
}


enum ArticleTargetType: TargetType {
    
    case articles(days: Int)
    
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return ArticleStoreImpl.getBaseUrl()
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
            parameters = ["api-key": ArticleStoreImpl.getAPIKey()]
        }
        return parameters
    }
}
