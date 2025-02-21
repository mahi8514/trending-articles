//
//  ExtensionsTest.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import XCTest
@testable import trending_articles

final class ExtensionsTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testYearMonthDayFormatter() throws {
        let dateFormatter = DateFormatter.yearMonthDayFormatter
        let calendar = Calendar.current
        let components: DateComponents = .init(year: 2025, month: 2, day: 20)
        let date = calendar.date(from: components)!
        let formattedDate = dateFormatter.string(from: date)
        XCTAssertEqual(formattedDate, "2025-02-20")
        let convertedDate = dateFormatter.date(from: "2025-02-20")
        XCTAssertNotNil(convertedDate)
        XCTAssertEqual(calendar.dateComponents([.year, .month, .day], from: convertedDate!), components)
    }
    
    func testcURL() throws {
        let expectedPlainRequestcURL = "curl -X GET 'https://example.com/fetch' "
        XCTAssertEqual(expectedPlainRequestcURL, try MockTargetType.articlesFetch.makeURLRequest().cURL())
        
        let expectedParametersRequestcURL = "curl -X GET 'https://example.com/fetch?category=tech' "
        XCTAssertEqual(expectedParametersRequestcURL, try MockTargetType.articlesFetchByCategory("tech").makeURLRequest().cURL())
    }
    
}
