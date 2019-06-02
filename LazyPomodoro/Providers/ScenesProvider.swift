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
    
    func createControllerWithScene(scene: SceneType) -> UIViewController {
        switch scene {
        case .timer:
            if let viewModel = viewModelsProvider.createViewModelForScene(scene: scene) as? TimerControllerViewModel {
                let controller = TimerViewController(viewModel: viewModel)
                controller.bindViewModel()
                return controller
            }
        case .statistics:
            if let viewModel = viewModelsProvider.createViewModelForScene(scene: scene) as? StatisticsControllerViewModel {
                let controller = StatisticsViewController(viewModel: viewModel)
                controller.bindViewModel()
            }
        default:
            return UIViewController() //TODO msaveleva: fix
        }
        
        assertionFailure("Can't create controller for scene")
        return UIViewController()
    }
}
