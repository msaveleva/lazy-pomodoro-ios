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
    
    private(set) var viewModel: TimerControllerViewModel
    
    init(viewModel: TimerControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = TimerControllerViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = UIColor.lp_mainFillColor()
    }
    
    func bindViewModel() {
        //TODO msaveleva: implement using RxSwift
    }
    
}
