//
//  ProjectsControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 02/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class ProjectsControllerViewModel: ViewModelProtocol {
    
    private let scenesRouter: ScenesRouter
    
    init(scenesRouter: ScenesRouter) {
        self.scenesRouter = scenesRouter
    }
    
    func dependenciesInjected() {
        //TODO msaveleva: implement.
    }
    
    //MARK: - Public methods
    public func showCreateScreen() {
        //TODO msaveleva: handle transition.
    }
    
}
