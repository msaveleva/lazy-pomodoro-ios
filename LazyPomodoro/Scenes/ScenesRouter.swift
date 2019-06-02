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
    private let tabBarController = UITabBarController()
    
    private let scenesProvider: ScenesProvider
    
    required init(window: UIWindow, scenesProvider: ScenesProvider) {
        self.window = window
        self.scenesProvider = scenesProvider
        currentViewController = window.rootViewController
    }
    
    func tabBarControllerSetup(completion: @escaping () -> Void) {
        let timersController = scenesProvider.createControllerWithScene(scene: .timers)
        timersController.tabBarItem = UITabBarItem(title: "Timers", image: nil, tag: 0)
        
        let statisticsController = scenesProvider.createControllerWithScene(scene: .statistics)
        statisticsController.tabBarItem = UITabBarItem(title: "Statistics", image: nil, tag: 1)
        
        let projectsController = scenesProvider.createControllerWithScene(scene: .projects)
        projectsController.tabBarItem = UITabBarItem(title: "Projects", image: nil, tag: 2)
        
        let settingsController = scenesProvider.createControllerWithScene(scene: .Settings)
        settingsController.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 3)
        
        window.rootViewController = tabBarController
        tabBarController.viewControllers = [timersController,
                                            statisticsController,
                                            projectsController,
                                            settingsController]
        completion()
    }
    
    func transition(to scene: SceneType, transitionType: SceneTransitionType, completion: @escaping () -> Void) {
        let viewController = scenesProvider.createControllerWithScene(scene: scene)
        switch transitionType {
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
