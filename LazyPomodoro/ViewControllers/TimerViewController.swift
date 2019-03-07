//
//  TimerViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, BindableTypeProtocol {
    
    var viewModel: TimerControllerViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.lp_fillWithDefaultGradient()
    }
    
    func bindViewModel() {
        //TODO msaveleva: implement
    }
    
}
