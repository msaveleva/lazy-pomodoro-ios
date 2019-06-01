//
//  SceneCoordinator.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

class ScenesRouter {
    
    private let window: UIWindow!
    private var currentViewController: UIViewController?
    
    private let scenesProvider: ScenesProvider
    
    required init(window: UIWindow, scenesProvider: ScenesProvider) {
        self.window = window
        self.scenesProvider = scenesProvider
        currentViewController = window.rootViewController
    }
    
    func transition(to scene: SceneType, transitionType: SceneTransitionType, completion: @escaping () -> Void) {
        let viewController = scenesProvider.createControllerWithScene(scene: scene)
        switch transitionType {
        case .root:
            window.rootViewController = viewController
            completion()
        case .push:
            guard let navigationController = currentViewController?.navigationController else {
                fatalError("Can't push view controller without navigation controller. ")
            }
            
            navigationController.pushViewController(viewController, animated: true)
            completion()
        case .modal:
            currentViewController?.present(viewController, animated: true, completion: {
                completion()
            })
        }
        
        currentViewController = viewController
    }
    
    func pop(animated: Bool, completion: @escaping () -> Void) {
        if let presenterController = currentViewController?.presentingViewController {
            //Dismiss modal view controller.
            currentViewController?.dismiss(animated: animated) { [weak self] in
                self?.currentViewController = presenterController
                completion()
            }
        } else if let navigationController = currentViewController?.navigationController {
            navigationController.popViewController(animated: animated)
            currentViewController = navigationController.viewControllers.last
        }
    }
}
