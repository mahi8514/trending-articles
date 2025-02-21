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

struct Article: Codable, Equatable {
    
    let id: Int
    let url: String
    let source: String
    let publishedDate: Date
    let section: String
    let subsection: String
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let desFacet: [String]
    let orgFacet: [String]
    let perFacet: [String]
    let geoFacet: [String]
    let media: [Media]
    
    struct Media: Codable, Equatable {
        let type: String
        let subtype: String
        let caption: String?
        let mediaMetadata: [MediaMetadata]
        
        enum CodingKeys: String, CodingKey {
            case type, subtype, caption
            case mediaMetadata = "media-metadata"
        }
        
        struct MediaMetadata: Codable, Equatable {
            let url: String
            let format: String
        }
    }
    
    var mediaURLs: [URL] {
        let allMetadatas = media.compactMap { $0.mediaMetadata.last?.url }
        return allMetadatas.compactMap(URL.init(string:))
    }
    
    var thumbnailURL: URL? {
        guard let thumbnailURLString = media.first?.mediaMetadata.first?.url else { return nil }
        return URL(string: thumbnailURLString)
    }
    
}

extension Article {
    
    static var preview: Article {
        .init(id: 1, url: "https://www.example.com",
              source: "Example source",
              publishedDate: Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: .now)!,
              section: "Example section",
              subsection: "Example subsection",
              byline: "By, example author 1 and example author 2",
              type: "Example type",
              title: "Example title",
              abstract: "Example abstract",
              desFacet: [],
              orgFacet: [],
              perFacet: [],
              geoFacet: [],
              media: [.init(type: "",
                            subtype: "",
                            caption: "",
                            mediaMetadata: [.init(url: "https://www.highfile.com/wp-content/uploads/2024/05/A4-Newspaper-Article-Template-Page-01.png",
                                                  format: "png")]),
                      .init(type: "",
                            subtype: "",
                            caption: "",
                            mediaMetadata: [.init(url: "https://www.sribestariinternational.edu.my/wp-content/uploads/2021/04/Providing-guidance-and-support-through-online-learning-1024x708.jpg",
                                                  format: "jpg")])])
    }
    
}
