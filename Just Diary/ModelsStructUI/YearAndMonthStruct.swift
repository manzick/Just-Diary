//
//  YearAndMonthStruct.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import Foundation

struct YearAndMonthStruct: Identifiable, Equatable {
    var months: [YearAndMonthStruct]? = nil
    var year: String = ""
    let name: String
    let id = UUID()
    
    public init(name: String, months: [YearAndMonthStruct]? = nil, year: String = "") {
        self.name = name
        self.months = months
        self.year = year
    }
    
    static func ==(left:YearAndMonthStruct, right:YearAndMonthStruct) -> Bool {
        return left.name == right.name && left.months == right.months
    }
}
