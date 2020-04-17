//
//  SettingsControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 02/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

struct TableViewSectionViewModel {
    let sectionTitle: String?
    let cellVMs: [TableViewCellConfigurable]
}

protocol SettingsViewControllerConfigurable where Self: ViewModelProtocol {
    var sectionsVMs: [TableViewSectionViewModel] { get }
}

class SettingsControllerViewModel: SettingsViewControllerConfigurable {
    private(set) var sectionsVMs = [TableViewSectionViewModel]()
    
    init() {
        self.dependenciesInjected()
    }
    
    internal func dependenciesInjected() {
        sectionsVMs.append(createBaseSettingsSection())
        sectionsVMs.append(createCustomModeSettingsSection())
        sectionsVMs.append(createGoalSettingsSection())
    }
    
    // MARK: - Creating additional view models
    
    private func createBaseSettingsSection() -> TableViewSectionViewModel {
        var baseSettingsVMs = [TableViewCellConfigurable]()
        
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
        
        return TableViewSectionViewModel(sectionTitle: nil, cellVMs: baseSettingsVMs)
    }
    
    private func createCustomModeSettingsSection() -> TableViewSectionViewModel {
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
        
        return TableViewSectionViewModel(sectionTitle: "Custom mode settings", cellVMs: customModeSettings)
    }
    
    private func createGoalSettingsSection() -> TableViewSectionViewModel {
        let cellVM = SubtitleTableViewCellVM(title: "Daily intervals goal", subtitle: "6") {
            //TODO: implement
        }
        
        return TableViewSectionViewModel(sectionTitle: "Goal", cellVMs: [cellVM])
    }
}
