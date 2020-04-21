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
    
    var dailyIntervalsGoal = 8
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
