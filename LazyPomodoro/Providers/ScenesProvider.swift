//
//  ScenesProvider.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

class ScenesProvider {
    
    private let viewModelsProvider: ViewModelsProvider
    
    init(viewModelsProvider: ViewModelsProvider) {
        self.viewModelsProvider = viewModelsProvider
    }
    
    func createControllerWithScene(scene: SceneType, scenesRouter: ScenesRouter) -> UIViewController {
        let vm = viewModelsProvider.createViewModelForScene(scene: scene, scenesRouter: scenesRouter)
        switch scene {
        case .timers:
            if let viewModel = vm as? TimerControllerViewModel {
                let controller = TimersViewController(viewModel: viewModel)
                controller.bindViewModel()
                return controller
            }
        case .statistics:
            if let viewModel = vm as? StatisticsControllerViewModel {
                let controller = StatisticsViewController(viewModel: viewModel)
                controller.bindViewModel()
                return controller
            }
        case .projects:
            if let viewModel = vm as? ProjectsControllerViewModel {
                let controller = ProjectsViewController(viewModel: viewModel)
                controller.bindViewModel()
                return controller
            }
        case .settings:
            if let viewModel = vm as? SettingsControllerViewModel {
                let controller = SettingsViewController(viewModel: viewModel)
                controller.bindViewModel()
                return controller
            }
        case .createProject:
            if let viewModel = vm as? CreateProjectControllerViewModel {
                let controller = CreateProjectViewController(viewModel: viewModel)
                controller.bindViewModel()
                return controller
            }
            
        case .designDemo:
            if let viewModel = vm as? DesignDemoControllerViewModel {
                let controller = DesignDemoViewController(viewModel: viewModel)
                controller.bindViewModel()
                return controller
            }
        }
        
        assertionFailure("Can't create controller for scene")
        return UIViewController()
    }
}
