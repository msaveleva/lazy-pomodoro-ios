//
//  TimersViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class TimersViewController: UIViewController, BindableTypeProtocol {
    
    private struct Constant {
        static let defaultMargin = 32
    }
    
    private(set) var viewModel: TimerControllerViewModel
    
    private var testLabel = UILabel()
    private var disposeBag = DisposeBag()
    
    //MARK: UI elements
    private var projectPomodoroStackView: ProgressStackView!
    private var startPauseButton: UIButton!
    
    init(viewModel: TimerControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unable to create controller via IB.")
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = UIColor.lp_mainFillColor()
        setupView()
    }
    
    private func setupView() {
        setupStartPauseButton()
        setupProgressBars()
    }
    
    func bindViewModel() {
        loadViewIfNeeded()
        
        projectPomodoroStackView.bindViewModel(viewModel.projectPomodoroStackVm)
        
        startPauseButton.rx.tap.subscribe { [weak self] _ in
            self?.viewModel.startPauseButtonPressed()
        }.disposed(by: disposeBag)
    }
}

extension TimersViewController {
    private func setupProgressBars() {
        projectPomodoroStackView = ProgressStackView.createDefaultProgressView()
        view.addSubview(projectPomodoroStackView)
        
        projectPomodoroStackView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(startPauseButton.snp_bottomMargin).offset(120) //TODO msaveleva: change
            make.leading.equalTo(view).offset(Constant.defaultMargin)
            make.trailing.equalTo(view).offset(-Constant.defaultMargin)
        }
    }
    
    private func setupStartPauseButton() {
        startPauseButton = UIButton(type: .system)
        startPauseButton.setTitle("Start Pause Button", for: .normal)
        startPauseButton.sizeToFit()
        view.addSubview(startPauseButton)
        
        startPauseButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(120) //TODO msaveleva: change
        }
    }
}
