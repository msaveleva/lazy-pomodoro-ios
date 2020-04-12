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
    
    private let tabBarController = UITabBarController()
    private let projectsNavController = UINavigationController()
    private let settingsNavController = UINavigationController()
    
    private let disposeBag = DisposeBag()
    
    private let scenesProvider: ScenesProvider
    
    required init(window: UIWindow, scenesProvider: ScenesProvider) {
        self.window = window
        self.scenesProvider = scenesProvider
    }
    
    //MARK: - Public methods
    func tabBarControllerSetup(completion: @escaping () -> Void) {
        setupTabBarController()
        
        window.rootViewController = tabBarController
        completion()
    }
    
    func transition(to scene: SceneType, transitionType: SceneTransitionType, completion: @escaping () -> Void) {
        let viewController = scenesProvider.createControllerWithScene(scene: scene, scenesRouter: self)
        switch transitionType {
        case .root:
            window.rootViewController = viewController
            completion()
        case .push:
            var navigationController: UINavigationController
            if let navController = getCurrentViewController().navigationController {
                navigationController = navController
            } else if let navController = getCurrentViewController() as? UINavigationController {
                navigationController = navController
            } else {
                fatalError("Can't push view controller without navigation controller. ")
            }
            
            navigationController.pushViewController(viewController, animated: true)
            completion()
        case .modal:
            getCurrentViewController().present(viewController, animated: true, completion: {
                completion()
            })
        }
    }
    
    //MARK: - Private methods
    private func getCurrentViewController() -> UIViewController {
        guard let rootControllers = tabBarController.viewControllers else {
            fatalError("No controllers presented.")
        }
        
        //TODO msaveleva: add handle for presented view controllers.
        let selectedTab = rootControllers[tabBarController.selectedIndex]
        if let navigationController = selectedTab as? UINavigationController,
            let topController = navigationController.topViewController {
            return topController
        } else {
            return selectedTab
        }
    }
}

//UI extension
extension ScenesRouter {
    private func setupTabBarController() {
        let timersController = scenesProvider.createControllerWithScene(scene: .timers, scenesRouter: self)
        timersController.tabBarItem = UITabBarItem(title: "Timers", image: UIImage(asset: IconAsset.tabBarTimers), tag: 0)
        
        let statisticsController = scenesProvider.createControllerWithScene(scene: .statistics, scenesRouter: self)
        statisticsController.tabBarItem = UITabBarItem(title: "Statistics", image: UIImage(asset: IconAsset.tabBarStatistics), tag: 1)
        
        projectsNavController.viewControllers = [scenesProvider.createControllerWithScene(scene: .projects, scenesRouter: self)]
        let projectsController = projectsNavController
        projectsController.tabBarItem = UITabBarItem(title: "Projects", image: UIImage(asset: IconAsset.tabBarProjects), tag: 2)
        
        settingsNavController.viewControllers = [scenesProvider.createControllerWithScene(scene: .settings, scenesRouter: self)]
        let settingsController = settingsNavController
        settingsController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(asset: IconAsset.tabBarSettings), tag: 3)
        
        tabBarController.viewControllers =
            [
                scenesProvider.embedInNavigationController(controller: timersController),
                statisticsController,
                projectsController,
                settingsController
            ]
    }
}
