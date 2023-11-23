//
//  DayPlanner.swift
//  DayPlannerCalender
//
//  Created by Sadhana Fagwani  on 21/11/23.
//

import Foundation

class DayPlanner: ObservableObject {
    @Published private var model = MyCalendar()
    
    var currentDate: Date {
        return model.currentDate
    }
    func setCurrentDate(to dateStr: String) {
        model.setCurrentDate(to: dateStr)
    }
    
    func dates() -> [Date] {
        model.datesInYear()
    }
}
