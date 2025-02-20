//
//  Configuration.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//

import Foundation

struct Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String, bundle: Bundle = .main) throws -> T where T: LosslessStringConvertible {
        guard let object = bundle.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum APIKeys {
    static var articleAPIKey: String {
        return try! Configuration.value(for: "ARTICLE_API_KEY")
    }
}
