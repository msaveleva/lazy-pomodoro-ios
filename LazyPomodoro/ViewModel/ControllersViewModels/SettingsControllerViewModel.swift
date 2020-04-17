//
//  SettingsControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 02/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

protocol SettingsViewControllerConfigurable where Self: ViewModelProtocol {
    var baseSettingsVMs: [LazySwitchTableViewCellConfigurable] { get }
    var sectionsTitles: [String?] { get }
}

class SettingsControllerViewModel: SettingsViewControllerConfigurable {
    private(set) var baseSettingsVMs = [LazySwitchTableViewCellConfigurable]()
    private(set) var sectionsTitles = [String?]()
    
    init() {
        self.dependenciesInjected()
    }
    
    internal func dependenciesInjected() {
        createSectionsTitles()
        createBaseSettingsViewModels()
    }
    
    // MARK: - Creating additional view models
    
    private func createSectionsTitles() {
        sectionsTitles.append(nil)
        sectionsTitles.append("Custom mode settings")
        sectionsTitles.append("Goals")
    }
    
    private func createBaseSettingsViewModels() {
        baseSettingsVMs.append(SwitchTableViewCellVM(text: "Intervals Auto Start", switchAction: { (value) in
            print("Auto start intervals: \(value)")
        }))
        baseSettingsVMs.append(SwitchTableViewCellVM(text: "Breaks Auto Start", switchAction: { (value) in
            print("Auto start breaks: \(value)")
        }))
        baseSettingsVMs.append(SwitchTableViewCellVM(text: "Prevent From Sleep", switchAction: { (value) in
            print("Prevent from sleep: \(value)")
        }))
        baseSettingsVMs.append(SwitchTableViewCellVM(text: "Show Motivating Quotes", switchAction: { (value) in
            print("Show quotes: \(value)")
        }))
    }
    
    private func createCustomModeSettingsViewModels() -> [TableViewCellConfigurable] {
        var customModeSettings = [TableViewCellConfigurable]()
        
        customModeSettings.append(SubtitleTableViewCellVM(title: "Work interval", subtitle: "75 min", action: {
            //TODO: implement
        }))
        customModeSettings.append(SubtitleTableViewCellVM(title: "Break interval", subtitle: "10 min", action: {
            //TODO: implement
        }))
        customModeSettings.append(SubtitleTableViewCellVM(title: "Long break interval", subtitle: "30 min", action: {
            //TODO: implement
        }))
        customModeSettings.append(SubtitleTableViewCellVM(title: "Intervals before long break", subtitle: "3", action: {
            //TODO: implement
        }))
        
        return customModeSettings
    }
}
