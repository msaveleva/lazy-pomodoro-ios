//
//  SettingsService.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 19.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation

class Settings {
    var autoStartIntervalEnabled = true
    var preventFromSleepEnabled = true
    var motivationQuotesEnabled = true
    
    /**
     All intervals are supposed to be in milliseconds.
     */
    var workInterval: TimeInterval = 25 * 60000
    var breakInterval: TimeInterval = 10 * 60000
    var longBreakInterval: TimeInterval = 30 * 60000
    
    var intervalsBeforeLongBreak = 3
    
    var dailyIntervalsGoal = 6
    
}

extension TimeInterval {
    func minutesToMilliseconds() -> TimeInterval {
        return self * 60000
    }
    
    func millisecondsToMinutes() -> TimeInterval {
        return self / 60000
    }
}

class SettingsUtil {
    enum Constant {
        static let minWorkInterval: TimeInterval = 60000
        static let maxWorkInterval: TimeInterval = 59 * 60000
        
        static let minBreakInterval: TimeInterval = 60000
        static let maxBreakInterval: TimeInterval = 20 * 60000
        
        static let minLongBreakInterval: TimeInterval = 60000
        static let maxLongBreakInterval: TimeInterval = 45 * 60000
        
        static let minNumberOfDailyIntervals = 1
        static let maxNumberOfDailyIntervals = 20
    }
    
    class func workIntervalsOptions() -> [TimeInterval] {
        return generateTimeOptions(minValue: Constant.maxWorkInterval,
                                   maxValue: Constant.maxWorkInterval)
    }
    
    class func breakIntervalsOptions() -> [TimeInterval] {
        return generateTimeOptions(minValue: Constant.minBreakInterval,
                                   maxValue: Constant.maxBreakInterval)
    }
    
    class func longBreakIntervalsOptions() -> [TimeInterval] {
        return generateTimeOptions(minValue: Constant.minLongBreakInterval,
                                   maxValue: Constant.maxLongBreakInterval)
    }
    
    class func dailyIntervalsOptions() -> [Int] {
        return Array(Constant.minNumberOfDailyIntervals...Constant.maxNumberOfDailyIntervals)
    }
    
    private class func generateTimeOptions(minValue: TimeInterval, maxValue: TimeInterval, step: TimeInterval = 60000) -> [TimeInterval] {
        let numberOfElements = Int(Constant.maxWorkInterval / Constant.minWorkInterval)
        
        var options: [TimeInterval] = [Constant.minWorkInterval]
        for i in 1..<numberOfElements {
            let newElement = options[i - 1] + step
            options.append(newElement)
        }
        
        return options
    }
}

class SettingsService {
    private enum UserDefaultKey {
        static let autoStartIntervalEnabled = "autoStartIntervalEnabled"
        static let preventFromSleepEnabled = "preventFromSleepEnabled"
        static let motivationQuotesEnabled = "motivationQuotesEnabled"
        
        static let workInterval = "workInterval"
        static let breakInterval = "breakInterval"
        static let longBreakInterval = "longBreakInterval"
        
        static let intervalsBeforeLongBreak = "intervalsBeforeLongBreak"
        
        static let dailyIntervalsGoal = "dailyIntervalsGoal"
    }
    
    private var userDefaults = UserDefaults.standard
    
    // MARK: - Saving values
    func saveAutoStartIntervalEnabled(value: Bool) {
        userDefaults.set(value, forKey: UserDefaultKey.autoStartIntervalEnabled)
    }
    
    func savePreventFromSleepEnabled(value: Bool) {
        userDefaults.set(value, forKey: UserDefaultKey.preventFromSleepEnabled)
    }
    
    func saveMotivationQuotesEnabled(value: Bool) {
        userDefaults.set(value, forKey: UserDefaultKey.motivationQuotesEnabled)
    }
    
    func saveWorkInterval(value: TimeInterval) {
        userDefaults.set(value, forKey: UserDefaultKey.workInterval)
    }
    
    func saveBreakInterval(value: TimeInterval) {
        userDefaults.set(value, forKey: UserDefaultKey.breakInterval)
    }
    
    func saveLongBreakInterval(value: TimeInterval) {
        userDefaults.set(value, forKey: UserDefaultKey.longBreakInterval)
    }
    
    func saveIntervalsBeforeLongBreak(value: Int) {
        userDefaults.set(value, forKey: UserDefaultKey.intervalsBeforeLongBreak)
    }
    
    func saveDailyIntervalsGoal(value: Int) {
        userDefaults.set(value, forKey: UserDefaultKey.dailyIntervalsGoal)
    }
    
    // MARK: - Load settings
    func loadSettings() -> Settings {
        let settings = Settings()
        
        if let value = userDefaults.value(forKey: UserDefaultKey.autoStartIntervalEnabled) as? Bool {
            settings.autoStartIntervalEnabled = value
        }
        if let value = userDefaults.value(forKey: UserDefaultKey.preventFromSleepEnabled) as? Bool {
            settings.preventFromSleepEnabled = value
        }
        if let value = userDefaults.value(forKey: UserDefaultKey.motivationQuotesEnabled) as? Bool {
            settings.motivationQuotesEnabled = value
        }
        
        if let value = userDefaults.value(forKey: UserDefaultKey.workInterval) as? TimeInterval {
            settings.workInterval = value
        }
        if let value = userDefaults.value(forKey: UserDefaultKey.breakInterval) as? TimeInterval {
            settings.breakInterval = value
        }
        if let value = userDefaults.value(forKey: UserDefaultKey.longBreakInterval) as? TimeInterval {
            settings.longBreakInterval = value
        }
        
        if let value = userDefaults.value(forKey: UserDefaultKey.intervalsBeforeLongBreak) as? Int {
            settings.intervalsBeforeLongBreak = value
        }
        if let value = userDefaults.value(forKey: UserDefaultKey.dailyIntervalsGoal) as? Int {
            settings.dailyIntervalsGoal = value
        }
        
        return settings
    }
    
}
