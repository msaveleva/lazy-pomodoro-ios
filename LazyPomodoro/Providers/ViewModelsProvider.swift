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
    
    func createViewModelForScene(scene: SceneType, scenesRouter: ScenesRouter) -> ViewModelProtocol {
        switch scene {
        case .timers:
            let container = TimersServicesContainer(timerService: servicesProvider.timerService,
                                                    databaseService: servicesProvider.databaseService)
            let timerControllerViewModel = TimerControllerViewModel(with: container)
            return timerControllerViewModel
        case .statistics:
            let statisticsControllerViewModel = StatisticsControllerViewModel()
            return statisticsControllerViewModel
        case .projects:
            let projectsControllerViewModel = ProjectsControllerViewModel(scenesRouter: scenesRouter)
            return projectsControllerViewModel
        case .settings:
            let settingsControllerViewModel = SettingsControllerViewModel()
            return settingsControllerViewModel
        case .createProject:
            let createProjectControllerViewModel = CreateProjectControllerViewModel(scenesRouter: scenesRouter)
            createProjectControllerViewModel.dependenciesInjected()
            return createProjectControllerViewModel
            
        case .designDemo:
            let designDemoViewModel = DesignDemoControllerViewModel()
            designDemoViewModel.dependenciesInjected()
            return designDemoViewModel
        }
    }
    
}
