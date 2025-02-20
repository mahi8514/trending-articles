//
//  Error.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//

enum NetworkError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case timeout
    case conflict
    case gone
    case tooManyRequests
    case serverError
    case noInternetConnection
    case invalidURL
    case invalidResponse
    case decodingError(message: String)
    case unknownError(statusCode: Int)
    
    init(from statusCode: Int) {
        switch statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 408:
            self = .timeout
        case 409:
            self = .conflict
        case 410:
            self = .gone
        case 429:
            self = .tooManyRequests
        case 500:
            self = .serverError
        default:
            self = .unknownError(statusCode: statusCode)
        }
    }
}
