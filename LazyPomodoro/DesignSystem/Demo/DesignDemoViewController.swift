//
//  DesignDemoViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 2.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class DesignDemoViewController: UIViewController {
    private(set) var viewModel: DesignDemoControllerViewModel
    let disposeBag = DisposeBag()
    
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
        
//        setupLazyProgress()
        setupLazyButton()
    }
    
    func bindViewModel() {
        
    }
    
    private func setupLazyProgress() {
        let lazyProgressView = LazyProgressView.createDefaultProgressView()
        
        view.addSubview(lazyProgressView)
        lazyProgressView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        lazyProgressView.bindViewModel(viewModel.demoLazyProgressVM)
    }
    
    private func setupLazyButton() {
        let lazyButton = LazyButton.createLazyButton()
        
        view.addSubview(lazyButton)
        lazyButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        lazyButton.setTitle("Japanese Language Course", for: .normal)
        lazyButton.rx.tap.subscribe(onNext: { _ in
            print("Hello world!")
        }).disposed(by: disposeBag)
    }
}
