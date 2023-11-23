//
//  MyCalender.swift
//  DayPlannerCalender
//
//  Created by Sadhana Fagwani  on 21/11/23.
//

import Foundation

struct MyCalendar {
    private(set) var today = Date()
    private(set) var currentDate: Date
    private var calendar = Calendar(identifier: .iso8601)
    let dateFormatter = DateFormatter()
    
    init() {
        calendar.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let todayStr = dateFormatter.string(from: today)
        currentDate = dateFormatter.date(from: todayStr)!
    }
   mutating func setCurrentDate(to dateStr: String) {
        let d = dateFormatter.date(from: dateStr)
       if let d {
           currentDate = d
       }
    }
    func datesInYear() -> [Date] {
        let currentYear = calendar.component(.year, from: currentDate)
        let startOfYear = calendar.date(from: DateComponents(year: currentYear, month: 1, day: 1))
        let range = calendar.range(of: .day, in: .year, for: startOfYear!)!
        let datesArrInYear = range.compactMap {
            calendar.date(byAdding: .day, value: $0 - 1, to: startOfYear!)
        }
        return datesArrInYear
        
    }
}
extension Date {
    func monthYYYY() -> String {
        return self.formatted(.dateTime .month( .wide ) .year())
    }
    
    func weekDayAbbrev() -> String {
        return self.formatted(.dateTime .weekday( .abbreviated))
    }
    
    func dayNum() -> String {
        return self.formatted(.dateTime .day())
    }
}
