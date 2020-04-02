//
//  DesignDemoViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 2.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit

class DesignDemoViewController: UIViewController {
    private(set) var viewModel: DesignDemoControllerViewModel
    
    init(viewModel: DesignDemoControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unable to create controller via IB.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        bindViewModel()
    }
    
    func bindViewModel() {
        
    }
}
