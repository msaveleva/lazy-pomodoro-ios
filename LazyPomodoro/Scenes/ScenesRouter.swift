//
//  SceneCoordinator.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import RxSwift

class ScenesRouter {
    
    private let window: UIWindow!
    private var currentViewController: UIViewController?
    private let tabBarController = UITabBarController()
    private let projectsNavController = UINavigationController()
    private let settingsNavController = UINavigationController()
    
    private let disposeBag = DisposeBag()
    
    private let scenesProvider: ScenesProvider
    
    required init(window: UIWindow, scenesProvider: ScenesProvider) {
        self.window = window
        self.scenesProvider = scenesProvider
        currentViewController = window.rootViewController
    }
    
    func tabBarControllerSetup(completion: @escaping () -> Void) {
        let timersController = scenesProvider.createControllerWithScene(scene: .timers, scenesRouter: self)
        timersController.tabBarItem = UITabBarItem(title: "Timers", image: nil, tag: 0)
        
        let statisticsController = scenesProvider.createControllerWithScene(scene: .statistics, scenesRouter: self)
        statisticsController.tabBarItem = UITabBarItem(title: "Statistics", image: nil, tag: 1)
        
        projectsNavController.viewControllers = [scenesProvider.createControllerWithScene(scene: .projects, scenesRouter: self)]
        let projectsController = projectsNavController
        projectsController.tabBarItem = UITabBarItem(title: "Projects", image: nil, tag: 2)
        
        settingsNavController.viewControllers = [scenesProvider.createControllerWithScene(scene: .settings, scenesRouter: self)]
        let settingsController = settingsNavController
        settingsController.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 3)
        
        window.rootViewController = tabBarController
        tabBarController.viewControllers = [timersController,
                                            statisticsController,
                                            projectsController,
                                            settingsController]
        
        tabBarController.rx.didSelect.subscribe(onNext: { [unowned self] selectedController in
            if let controller = selectedController as? UINavigationController {
                self.currentViewController = controller.viewControllers.first
            } else {
                self.currentViewController = selectedController
            }
        }).disposed(by: disposeBag)
        
        completion()
    }
    
    func transition(to scene: SceneType, transitionType: SceneTransitionType, completion: @escaping () -> Void) {
        let viewController = scenesProvider.createControllerWithScene(scene: scene, scenesRouter: self)
        switch transitionType {
        case .push:
            guard let navigationController = currentViewController?.navigationController else {
                fatalError("Can't push view controller without navigation controller. ")
            }
            
            navigationController.pushViewController(viewController, animated: true)
            currentViewController = viewController
            completion()
        case .modal:
            currentViewController = viewController
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
