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

class TimersViewController: UIViewController, BindableTypeProtocol, LazyNavigation {
    private struct Constant {
        static let defaultMargin = 32
    }
    
    private(set) var viewModel: TimerViewControllerConfigurable
    
    private var testLabel = UILabel()
    private(set) var disposeBag = DisposeBag()
    
    //MARK: UI elements
    private var projectPomodoroStackView: LazyProgressView!
    private var startPauseButton: LazyPlayButton!
    
    init(viewModel: TimerViewControllerConfigurable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unable to create controller via IB.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupUI()
        
        bindViewModel()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.lp_mainFillColor()
        
        setupStartPauseButton()
        setupProgressBars()
    }
    
    func bindViewModel() {
        title = "Timers" //TODO: get localized strings from viewModel
        
        projectPomodoroStackView.bindViewModel(viewModel.projectPomodoroStackVm)
        
        startPauseButton.rx.tap.subscribe { [weak self] _ in
            guard let strongSelf = self else { return }
            
            strongSelf.startPauseButton.isPlaying = !strongSelf.startPauseButton.isPlaying
            strongSelf.viewModel.startPauseButtonPressed()
        }.disposed(by: disposeBag)
    }
    
    // MARK: - Private methods
    private func setupNavigationBar() {
        setupCustomNavigationBar()
        addButtonItem(to: .right, image: IconAsset.navibarMode) {
            print("Show navibar mode")
        }
    }
    
    private func setupProgressBars() {
        projectPomodoroStackView = LazyProgressView.createDefaultProgressView()
        view.addSubview(projectPomodoroStackView)
        
        projectPomodoroStackView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(startPauseButton.snp_bottomMargin).offset(120) //TODO msaveleva: change
            make.leading.equalTo(view).offset(Constant.defaultMargin)
            make.trailing.equalTo(view).offset(-Constant.defaultMargin)
        }
    }
    
    private func setupStartPauseButton() {
        startPauseButton = LazyPlayButton.createLazyPlayButton()
        view.addSubview(startPauseButton)
        
        startPauseButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(120)
        }
    }
}
