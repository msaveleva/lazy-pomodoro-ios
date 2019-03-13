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
    
    func createViewModelForScene(scene: Scene) -> ViewModelProtocol {
        switch scene {
        case .timer:
            return TimerControllerViewModel()
        }
    }
    
}
