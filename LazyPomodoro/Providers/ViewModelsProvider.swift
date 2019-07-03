//
//  ViewModelsProvider.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class ViewModelsProvider {
    
    private let servicesProvider: ServicesProvider
    
    init(servicesProvider: ServicesProvider) {
        self.servicesProvider = servicesProvider
    }
    
    func createViewModelForScene(scene: SceneType) -> ViewModelProtocol {
        switch scene {
        case .timers:
            let timerControllerViewModel = TimerControllerViewModel()
            timerControllerViewModel.timerService = servicesProvider.timerService
            timerControllerViewModel.databaseService = servicesProvider.databaseService
            timerControllerViewModel.dependenciesInjected()
            return timerControllerViewModel
        case .statistics:
            let statisticsControllerViewModel = StatisticsControllerViewModel()
            return statisticsControllerViewModel
        case .projects:
            let projectsControllerViewModel = ProjectsControllerViewModel()
            return projectsControllerViewModel
        case .settings:
            let settingsControllerViewModel = SettingsControllerViewModel()
            return settingsControllerViewModel
        }
    }
    
}
