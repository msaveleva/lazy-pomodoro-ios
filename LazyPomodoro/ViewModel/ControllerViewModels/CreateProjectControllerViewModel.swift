//
//  CreateProjectControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/07/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class CreateProjectControllerViewModel: ViewModelProtocol {
    
    private let scenesRouter: ScenesRouter
    
    init(scenesRouter: ScenesRouter) {
        self.scenesRouter = scenesRouter
    }
    
    func dependenciesInjected() {
        //TODO msaveleva: implement.
    }
    
}
