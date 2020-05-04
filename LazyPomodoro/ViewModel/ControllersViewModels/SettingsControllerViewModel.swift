//
//  SettingsControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 02/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

struct SettingsServicesContainer {
    let settingsService: SettingsService
}

protocol SettingsViewControllerConfigurable where Self: ViewModelProtocol {
    var sectionsVMs: [TableViewSectionViewModel] { get }
    
    init(with container: SettingsServicesContainer)
}

class SettingsControllerViewModel: SettingsViewControllerConfigurable {
    private let container: SettingsServicesContainer
    
    private(set) var sectionsVMs = [TableViewSectionViewModel]()
    private(set) var settings = Settings()
    
    required init(with container: SettingsServicesContainer) {
        self.container = container
        
        self.dependenciesInjected()
    }
    
    internal func dependenciesInjected() {
        settings = getSettingsService().loadSettings()
        
        sectionsVMs.append(createBaseSettingsSection())
        sectionsVMs.append(createCustomModeSettingsSection())
        sectionsVMs.append(createGoalSettingsSection())
    }
    
    // MARK: - Creating additional view models
    
    private func createBaseSettingsSection() -> TableViewSectionViewModel {
        var baseSettingsVMs = [TableViewCellConfigurable]()
        
        baseSettingsVMs.append(SwitchTableViewCellVM(text: "Intervals Auto Start",
                                                     value: settings.autoStartIntervalEnabled,
                                                     switchAction: { [weak self] (value) in
            guard let strongSelf = self else { return }
            
            strongSelf.settings.autoStartIntervalEnabled = value
            strongSelf.getSettingsService().saveAutoStartIntervalEnabled(value: value)
            print("Auto start intervals: \(value)")
        }))
        
        baseSettingsVMs.append(SwitchTableViewCellVM(text: "Prevent From Sleep",
                                                     value: settings.preventFromSleepEnabled,
                                                     switchAction: { [weak self] (value) in
            guard let strongSelf = self else { return }

            strongSelf.settings.preventFromSleepEnabled = value
            strongSelf.getSettingsService().savePreventFromSleepEnabled(value: value)
            print("Prevent from sleep: \(value)")
        }))
        
        baseSettingsVMs.append(SwitchTableViewCellVM(text: "Show Motivating Quotes",
                                                     value: settings.motivationQuotesEnabled,
                                                     switchAction: { [weak self] (value) in
            guard let strongSelf = self else { return }

            strongSelf.settings.motivationQuotesEnabled = value
            strongSelf.getSettingsService().saveMotivationQuotesEnabled(value: value)
            print("Show quotes: \(value)")
        }))
        
        return TableViewSectionViewModel(sectionTitle: nil, cellVMs: baseSettingsVMs)
    }
    
    private func createCustomModeSettingsSection() -> TableViewSectionViewModel {
        var customModeSettings = [TableViewCellConfigurable]()
        let customSuffix = " min"
        
        //Work Interval
        let workSelectedIndex = SettingsUtil.workIntervalsOptions().firstIndex(of: settings.workInterval) ?? 0
        let workOptions = SettingsUtil.workIntervalsOptions().map { (value) -> String in
            String(format: "%.0f", value.millisecondsToMinutes())
        }
        customModeSettings.append(SubtitleTableViewCellVM(title: "Work Interval", customSuffix: customSuffix, selectedOptionIndex: workSelectedIndex, optionsValues: workOptions, selectOptionsAtIndex: { [weak self] index in
            guard let self = self else { return }
            
            if let value = TimeInterval(workOptions[index]) {
                let valueToSave = value.minutesToMilliseconds()
                self.settings.workInterval = valueToSave
                self.getSettingsService().saveWorkInterval(value: valueToSave)
            }
        }))

        //Break Interval
        let breakSelectedIndex = SettingsUtil.breakIntervalsOptions().firstIndex(of: settings.breakInterval) ?? 0
        let breakOptions = SettingsUtil.breakIntervalsOptions().map { (value) -> String in
            String(format: "%.0f", value.millisecondsToMinutes())
        }
        customModeSettings.append(SubtitleTableViewCellVM(title: "Break Interval", customSuffix: customSuffix, selectedOptionIndex: breakSelectedIndex, optionsValues: breakOptions, selectOptionsAtIndex: { [weak self] index in
            guard let self = self else { return }
            
            if let value = TimeInterval(breakOptions[index]) {
                let valueToSave = value.minutesToMilliseconds()
                self.settings.breakInterval = valueToSave
                self.getSettingsService().saveBreakInterval(value: valueToSave)
            }
        }))

        //Long Break Interval
        let longBreakSelectedIndex = SettingsUtil.longBreakIntervalsOptions().firstIndex(of: settings.longBreakInterval) ?? 0
        let longBreakOptions = SettingsUtil.longBreakIntervalsOptions().map { (value) -> String in
            String(format: "%.0f", value.millisecondsToMinutes())
        }
        customModeSettings.append(SubtitleTableViewCellVM(title: "Long Break Interval", customSuffix: customSuffix, selectedOptionIndex: longBreakSelectedIndex, optionsValues: longBreakOptions, selectOptionsAtIndex: { [weak self] index in
            guard let self = self else { return }
            
            if let value = TimeInterval(longBreakOptions[index]) {
                let valueToSave = value.minutesToMilliseconds()
                self.settings.longBreakInterval = valueToSave
                self.getSettingsService().saveLongBreakInterval(value: valueToSave)
            }
        }))

        //Intervals Before Long Break
        let selectedIndex = SettingsUtil.intervalsBeforeLongBreakOptions().firstIndex(of: settings.intervalsBeforeLongBreak) ?? 0
        let options = SettingsUtil.intervalsBeforeLongBreakOptions().map { (value) -> String in
            "\(value)"
        }
        
        customModeSettings.append(SubtitleTableViewCellVM(title: "Intervals Before Long Break", selectedOptionIndex: selectedIndex, optionsValues: options, selectOptionsAtIndex: { [weak self] index in
            guard let self = self else { return }
            
            if let value = Int(options[index]) {
                self.settings.intervalsBeforeLongBreak = value
                self.getSettingsService().saveIntervalsBeforeLongBreak(value: value)
            }
        }))
        
        return TableViewSectionViewModel(sectionTitle: "Custom mode settings", cellVMs: customModeSettings)
    }
    
    private func createGoalSettingsSection() -> TableViewSectionViewModel {
        let selectedIndex = SettingsUtil.dailyIntervalsOptions().firstIndex(of: settings.dailyIntervalsGoal) ?? 0
        let options = SettingsUtil.dailyIntervalsOptions().map { (value) -> String in
            "\(value)"
        }
        
        let cellVM = SubtitleTableViewCellVM(title: "Daily intervals goal", selectedOptionIndex: selectedIndex, optionsValues: options) { [weak self] index in
            guard let self = self else { return }
            
            if let value = Int(options[index]) {
                self.settings.dailyIntervalsGoal = value
                self.getSettingsService().saveDailyIntervalsGoal(value: value)
            }
        }
        
        return TableViewSectionViewModel(sectionTitle: "Goal", cellVMs: [cellVM])
    }
    
    private func getSettingsService() -> SettingsService {
        return container.settingsService
    }
}
