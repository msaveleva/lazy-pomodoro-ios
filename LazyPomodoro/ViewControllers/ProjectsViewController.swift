//
//  ProjectsViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 02/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import os

class ProjectsViewController: UIViewController, BindableTypeProtocol {

    private(set) var viewModel: ProjectsControllerViewModel
    private let disposeBag = DisposeBag()
    
    let createProjectBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    
    init(viewModel: ProjectsControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unable to create controller via IB.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lp_mainFillColor()
        title = "Projects"
        
        setupUI()
    }
    
    func bindViewModel() {
        createProjectBarButtonItem.rx.tap.subscribe(onNext: { _ in
            os_log("Creating project!", log: Log.ui, type: .info)
        }).disposed(by: disposeBag)
    }
    
    //MARK: - Private methods
    private func setupUI() {
        navigationItem.rightBarButtonItem = createProjectBarButtonItem
        
    }

}
