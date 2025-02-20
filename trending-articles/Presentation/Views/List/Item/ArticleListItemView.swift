//
//  ArticleListItemView.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import SwiftUI

struct ArticleListItemView: View {
    
    let article: Article
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ArticleListItemView(article: .init(id: 1, url: "https://www.example.com",
                                       source: "Example source",
                                       publishedDate: .now,
                                       section: "Example section",
                                       subsection: "Example subsection",
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
                                                                           format: "png")])]))
}


