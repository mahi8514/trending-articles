//
//  Logger.swift
//  trending-articles
//
//  Created by mahi  on 20/02/2025.
//

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    Swift.print(items, separator: separator, terminator: terminator)
    #endif
}
