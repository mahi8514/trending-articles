//
//  TargetType.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//

import Foundation

typealias HTTPHeaders = [String: String]
typealias HTTPParameters = [String: String]

protocol TargetType {
    
    var scheme: String { get }
    
    var baseURL: String { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var headers: HTTPHeaders? { get }
    
    var task: HTTPTask { get }
    
}

extension TargetType {
    
    func makeURLRequest() throws -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host =  baseURL
        urlComponents.path = path

        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        switch task {
        case .requestPlain:
            return request
        case .requestParameters(let parameters):
//            if let requestUrl = request.url, var requestUrlComponents = URLComponents(url: requestUrl, resolvingAgainstBaseURL: false), !parameters.isEmpty {
//                requestUrlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
//            }
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
            return request
        case .requestJSONEncodable(let encodable, let encoder):
            request.httpBody = try encoder.encode(encodable)
            let contentTypeHeaderName = "Content-Type"
            if request.value(forHTTPHeaderField: contentTypeHeaderName) == nil {
                request.setValue("application/json", forHTTPHeaderField: contentTypeHeaderName)
            }
            return request
        }
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case patch = "PATCH"
}

enum HTTPTask {
    
    case requestPlain
    case requestJSONEncodable(Encodable, encoder: JSONEncoder = JSONEncoder())
    case requestParameters(parameters: HTTPParameters)
    
}
