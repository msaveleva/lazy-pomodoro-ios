//
//  Date+StartDates.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 14/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import os

extension Date {
    
    static func startOfTheDay() -> Date {
        return Calendar.current.startOfDay(for: Date())
    }
    
    static func startOfTheWeek() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        guard let sunday = calendar.date(from: components),
            let startOfTheWeek = calendar.date(byAdding: .day, value: 1, to: sunday) else {
                os_log("Can't find start of the week.", log: Log.utils, type: .error)
                fatalError()
        }
        
        return startOfTheWeek
    }
    
    static func startOfTheMonth() -> Date {
        guard let startOfTheMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month],
                                                                                                from: Calendar.current.startOfDay(for: Date()))) else {
            os_log("Can't receive the correct date.", log: Log.utils, type: .error)
            fatalError()
        }
        
        return startOfTheMonth
    }
    
}
