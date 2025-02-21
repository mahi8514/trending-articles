//
//  MockURLSession.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

@testable import trending_articles
import Foundation

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        guard let data = data, let response = response else {
            throw NSError(domain: "MockSession Error", code: 500, userInfo: nil)
        }
        return (data, response)
    }
}
