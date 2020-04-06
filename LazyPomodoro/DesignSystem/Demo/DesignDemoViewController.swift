//
//  DesignDemoViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 2.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit

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
        
        setupLazyProgress()
    }
    
    func bindViewModel() {
        
    }
    
    private func setupLazyProgress() {
        let lazyProgressView = LazyProgressView.createDefaultProgressView()
        
        view.addSubview(lazyProgressView)
        lazyProgressView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20 )
        }
        
        lazyProgressView.bindViewModel(viewModel.demoLazyProgressVM)
    }
}
