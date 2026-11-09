//
//  YearAndMonthStructTests.swift
//  Just DiaryTests
//
//  Created by Alexander Manzurov on 09.11.2026.
//

import XCTest
@testable import Just_Diary

final class YearAndMonthStructTests: XCTestCase {
    
    func testEqualWhenNameAndMonthsMatch() {
        let left = YearAndMonthStruct(name: "2022", months: [YearAndMonthStruct(name: "May", year: "2022")])
        let right = YearAndMonthStruct(name: "2022", months: [YearAndMonthStruct(name: "May", year: "2022")])
        
        XCTAssertEqual(left, right)
    }
    
    func testNotEqualWhenNameDiffers() {
        let left = YearAndMonthStruct(name: "2022")
        let right = YearAndMonthStruct(name: "2023")
        
        XCTAssertNotEqual(left, right)
    }
    
    func testNotEqualWhenMonthsDiffer() {
        let left = YearAndMonthStruct(name: "2022", months: [YearAndMonthStruct(name: "May", year: "2022")])
        let right = YearAndMonthStruct(name: "2022", months: [YearAndMonthStruct(name: "June", year: "2022")])
        
        XCTAssertNotEqual(left, right)
    }
    
    func testNotEqualWhenNameAndMonthsDiffer() {
        let left = YearAndMonthStruct(name: "2022", months: [YearAndMonthStruct(name: "May", year: "2022")])
        let right = YearAndMonthStruct(name: "2023", months: [YearAndMonthStruct(name: "June", year: "2023")])
        
        XCTAssertNotEqual(left, right)
    }
}
