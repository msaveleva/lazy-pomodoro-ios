//
//  LazyProgressView.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class LazyProgressView: UIStackView {
    private static let kProgressIndicatorHeight = 5
    private static let kDefaultMargin = 8
    
    private var viewModel: LazyProgressViewConfigurable!
    private let disposeBag = DisposeBag()
    
    private let titleLabel = UILabel()
    private let progressLabel = UILabel()
    private let progressIndicator = UIProgressView()
    
    class func createDefaultProgressView() -> LazyProgressView {
        let progressView = LazyProgressView(frame: .zero)
        progressView.axis = .vertical
        
        //Configure title
        progressView.titleLabel.font = UIFont.lp_body1()
        progressView.titleLabel.textColor = UIColor.lp_defaultTextColor()
        progressView.titleLabel.textAlignment = .left
        progressView.titleLabel.numberOfLines = 0
        
        progressView.addArrangedSubview(progressView.titleLabel)
        
        //Configure progress label
        progressView.progressLabel.font = UIFont.lp_body2()
        progressView.progressLabel.textColor = UIColor.lp_grayDarkest()
        progressView.progressLabel.textAlignment = .right
        
        progressView.addArrangedSubview(progressView.progressLabel)
        
        //Configure indicator
        let progressBackground = UIView()
        progressBackground.snp.makeConstraints { (make) in
            make.height.equalTo(kProgressIndicatorHeight + kDefaultMargin)
        }
        
        progressView.addArrangedSubview(progressBackground)
        progressBackground.addSubview(progressView.progressIndicator)
        progressView.progressIndicator.snp.makeConstraints { (make) in
            make.height.equalTo(kProgressIndicatorHeight)
            make.bottom.leading.trailing.equalTo(progressBackground	)
        }
        
        progressView.progressIndicator.trackImage = UIImage(asset: IconAsset.sliderBg)
        progressView.progressIndicator.progressImage = UIImage(asset: IconAsset.sliderFill)
        
        return progressView
    }
    
    func bindViewModel(_ vm: LazyProgressViewConfigurable) {
        viewModel = vm
        
        titleLabel.text = viewModel.title
        progressLabel.text = viewModel.getInitialProgressText()
        viewModel.progressTextObservable()
            .distinctUntilChanged()
            .bind(to: progressLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.progressValueObservable()
            .distinctUntilChanged()
            .bind(to: progressIndicator.rx.progress)
            .disposed(by: disposeBag)
    }
}
