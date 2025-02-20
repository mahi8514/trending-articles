//
//  Article.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//

import Foundation

struct ArticleResponse: Codable {
    let status: String
    let numResults: Int
    let results: [Article]
}

struct Article: Codable {
    
    let id: Int
    let url: String
    let source: String
    let publishedDate: Date
    let section: String
    let subsection: String
    let type: String
    let title: String
    let abstract: String
    let desFacet: [String]
    let orgFacet: [String]
    let perFacet: [String]
    let geoFacet: [String]
    let media: [Media]
    
    struct Media: Codable {
        let type: String
        let subtype: String
        let caption: String?
        let mediaMetadata: [MediaMetadata]
        
        enum CodingKeys: String, CodingKey {
            case type, subtype, caption
            case mediaMetadata = "media-metadata"
        }
        
        struct MediaMetadata: Codable {
            let url: String
            let format: String
        }
    }
    
}
