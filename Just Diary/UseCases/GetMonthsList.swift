//
//  GetMonthsList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 09.11.2026.
//

import Foundation

extension UseCases {
    func getMonthsList(forYear year: String, from memories: [Memory]) -> [String] {
        let calendar = Calendar.current
        let yearMemories = memories
            .filter { self.getYearFromDate($0.date) == year }
            .sorted { calendar.component(.month, from: $0.date) < calendar.component(.month, from: $1.date) }
        var monthsString: [String] = []
        for memory in yearMemories {
            monthsString.appendIfNotContains(
                self.getMonthFromDate(memory.date)
            )
        }
        return monthsString
    }
}
