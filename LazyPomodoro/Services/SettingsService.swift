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
    func loadSettings() -> Settings {
        let settings = Settings()
        
        //TODO: load from UserDefaults.
        
        return settings
    }
    
    func saveSettings(settings: Settings) {
        //TODO: save to UserDefaults
        let mirror = Mirror(reflecting: settings)
        
        for (index, attr) in mirror.children.enumerated() {
            print("Index: \(index), attribute: \(attr)")
            
            if let key = attr.label {
                UserDefaults.setValue(attr.value, forKey: key)
            }
        }
    }
}

extension SettingsService {
    private func getAttributes(for object: Any) -> [Mirror.Child] {
        let mirror = Mirror(reflecting: object)
        let attributes = mirror.children.enumerated().map { (value) -> Mirror.Child in
            value.element
        }
        
        return attributes
    }
}
