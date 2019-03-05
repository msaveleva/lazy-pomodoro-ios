//
//  Scene+ViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

extension Scene {
    func viewController() -> UIViewController {
        switch self {
        case .timer(let viewModel):
            let timerController = TimerViewController() //TODO msaveleva: check
            timerController.bindViewModel(to: viewModel)
            
            return timerController
        }
    }
}
