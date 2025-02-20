//
//  trending_articlesApp.swift
//  trending-articles
//
//  Created by mahi  on 19/02/2025.
//

import SwiftUI

@main
struct trending_articlesApp: App {
    
    init() {
        ArticleStoreImpl.activate(baseUrl: "paste_provider_url_here", apiKey: "paste_api_key_from_provider_here")
    }
    
    var body: some Scene {
        WindowGroup {
            ArticleNavigationView()
        }
    }
}
