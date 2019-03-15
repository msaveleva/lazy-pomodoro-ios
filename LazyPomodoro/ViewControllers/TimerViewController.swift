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
    
    struct Constant {
        static let defaultMargin = 32
    }
    
    private(set) var viewModel: TimerControllerViewModel
    
    private var testLabel = UILabel()
    private var disposeBag = DisposeBag()
    
    //MARK: UI elements
    private var projectPomodoroStackView: ProgressStackView!
    
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
        setupView()
    }
    
    private func setupView() {
        setupProgressBars()
    }
    
    private func setupProgressBars() {
        projectPomodoroStackView = ProgressStackView.createDefaultProgressView()
        view.addSubview(projectPomodoroStackView)
        projectPomodoroStackView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(120) //TODO msaveleva: change
            make.leading.equalTo(view).offset(Constant.defaultMargin)
            make.trailing.equalTo(view).offset(-Constant.defaultMargin)
        }
    }
    
    func bindViewModel() {
        loadViewIfNeeded()
        projectPomodoroStackView.bindViewModel(viewModel.getProjectPomodoroStackVm())
    }
    
}
