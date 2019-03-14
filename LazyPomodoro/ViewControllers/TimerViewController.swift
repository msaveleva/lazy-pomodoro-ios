//
//  TimerViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class TimerViewController: UIViewController, BindableTypeProtocol {
    
    private(set) var viewModel: TimerControllerViewModel
    
    private var testLabel = UILabel()
    private var disposeBag = DisposeBag()
    
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
        createTestLabel()
    }
    
    func bindViewModel() {
        viewModel.timerObservable()
            .map(viewModel.createTimeStringForCurrentInterval)
            .bind(to: testLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func createTestLabel() {
        testLabel.font = UIFont.lp_body1()
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.leading.greaterThanOrEqualTo(view.snp_leadingMargin)
            make.trailing.greaterThanOrEqualTo(view.snp_trailingMargin)
        }
    }
    
}
