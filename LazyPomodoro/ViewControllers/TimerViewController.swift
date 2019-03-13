//
//  TimerViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit

class TimerViewController: UIViewController, BindableTypeProtocol {
    
    var viewModel: TimerControllerViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = UIColor.lp_mainFillColor()
    }
    
    func bindViewModel() {
        //TODO msaveleva: implement using RxSwift
    }
    
}
