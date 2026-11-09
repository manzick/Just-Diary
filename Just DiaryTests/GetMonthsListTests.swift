//
//  GetMonthsListTests.swift
//  Just DiaryTests
//
//  Created by Alexander Manzurov on 09.11.2026.
//

import XCTest
@testable import Just_Diary

final class GetMonthsListTests: XCTestCase {
    
    private func makeMemory(year: Int, month: Int, day: Int = 15) -> Memory {
        let date = Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
        return Memory(date: date, title: "Title", message: "Message")
    }
    
    private func monthName(_ month: Int) -> String {
        UseCases.shared.getMonthFromDate(makeMemory(year: 2022, month: month).date)
    }
    
    func testAllTwelveMonthsAreReturned() {
        let memories = (1...12).map { makeMemory(year: 2022, month: $0) }
        
        let months = UseCases.shared.getMonthsList(forYear: "2022", from: memories)
        
        XCTAssertEqual(months, (1...12).map(monthName))
    }
    
    func testMonthsAreSortedChronologically() {
        let memories = [12, 3, 7, 1].map { makeMemory(year: 2022, month: $0) }
        
        let months = UseCases.shared.getMonthsList(forYear: "2022", from: memories)
        
        XCTAssertEqual(months, [1, 3, 7, 12].map(monthName))
    }
    
    func testMonthsAreNotDuplicated() {
        let memories = [
            makeMemory(year: 2022, month: 5, day: 1),
            makeMemory(year: 2022, month: 5, day: 20),
            makeMemory(year: 2022, month: 6)
        ]
        
        let months = UseCases.shared.getMonthsList(forYear: "2022", from: memories)
        
        XCTAssertEqual(months, [5, 6].map(monthName))
    }
    
    func testOtherYearsAreIgnored() {
        let memories = [
            makeMemory(year: 2021, month: 2),
            makeMemory(year: 2022, month: 4),
            makeMemory(year: 2023, month: 8)
        ]
        
        let months = UseCases.shared.getMonthsList(forYear: "2022", from: memories)
        
        XCTAssertEqual(months, [monthName(4)])
    }
    
    func testEmptyMemoriesReturnEmptyList() {
        XCTAssertEqual(UseCases.shared.getMonthsList(forYear: "2022", from: []), [])
    }
}
