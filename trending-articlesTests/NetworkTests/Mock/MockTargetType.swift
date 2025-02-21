//
//  MockTargetType.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

@testable import trending_articles
import Foundation

enum MockTargetType: TargetType {
    case articlesFetch
    case articlesFetchByCategory(String)
    case addArticle(Article)
        
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return "example.com"
    }
    
    var path: String {
        switch self {
        case .articlesFetch, .articlesFetchByCategory:
            return "/fetch"
        case .addArticle:
            return "/add"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .articlesFetch, .articlesFetchByCategory:
            return .get
        case .addArticle:
            return .post
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .articlesFetch, .articlesFetchByCategory, .addArticle:
            return nil
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .articlesFetch:
            return .requestPlain
        case .articlesFetchByCategory:
            return .requestParameters(parameters: ["category": "tech"])
        case .addArticle(let body):
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            encoder.dateEncodingStrategy = .formatted(.yearMonthDayFormatter)
            return .requestJSONEncodable(body, encoder: encoder)
        }
    }
}
