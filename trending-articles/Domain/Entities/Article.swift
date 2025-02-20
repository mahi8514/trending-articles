//
//  Article.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//

struct Article: Codable {
    
    let id: Int
    let url: String
    let source: String
    let publishedDate: String
    let updated: String
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
        
        struct MediaMetadata: Codable {
            let url: String
            let format: String
            let width: Int
            let height: Int
        }
    }
    
}
