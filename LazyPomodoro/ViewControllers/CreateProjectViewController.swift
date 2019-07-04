//
//  CreateProjectViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/07/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import RxSwift
import os

class CreateProjectViewController: UIViewController, BindableTypeProtocol {
    
    private(set) var viewModel: CreateProjectControllerViewModel
    private let disposeBag = DisposeBag()
    
    private let projectCreateBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: nil, action: nil)
    
    init(viewModel: CreateProjectControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unable to create controller via IB.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lp_mainFillColor()
        title = "New Project"
        setupUI()
    }
    
    func bindViewModel() {
        projectCreateBarButtonItem.rx.tap.subscribe(onNext: { _ in
            os_log("Handling project creation", log: Log.ui, type: .info)
        }).disposed(by: disposeBag)
    }
    
    //MARK: - Private methods
    private func setupUI() {
        navigationItem.rightBarButtonItem = projectCreateBarButtonItem
    }
}
