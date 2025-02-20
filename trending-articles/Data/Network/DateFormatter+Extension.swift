//
//  DateFormatter+Extension.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import Foundation

extension DateFormatter {
    static var yearMonthDayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}
