//
//  LazyQuoteView.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 7.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class LazyQuoteView: UIView {
    private enum ViewSizes {
        static let separatorSize = CGSize(width: 56, height: 1)
    }
    
    let viewModel: LazyQuoteViewConfigurable
    
    private(set) var quoteLabel = UILabel()
    private let separatorView = UIView()
    
    private let disposeBag = DisposeBag()
    
    init(with viewModel: LazyQuoteViewConfigurable) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        
        self.setupUI()
        self.bindViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindViewModel() {
        viewModel.quoteText.bind(to: quoteLabel.rx.text).disposed(by: disposeBag)
    }
    
    private func setupUI() {
        addSubview(quoteLabel)
        quoteLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().offset(Spacing.s40)
            make.bottom.lessThanOrEqualToSuperview().offset(-Spacing.s40)
            make.leading.greaterThanOrEqualToSuperview().offset(Spacing.s40)
            make.trailing.lessThanOrEqualToSuperview().offset(-Spacing.s40)
        }
        
        quoteLabel.numberOfLines = 0
        quoteLabel.textAlignment = .center
        quoteLabel.textColor = .lp_grayDarkest()
        quoteLabel.font = .lp_body1()
        
        addSeparator()
    }
    
    private func addSeparator() {
        addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.width.equalTo(ViewSizes.separatorSize.width)
            make.height.equalTo(ViewSizes.separatorSize.height)
            make.top.centerX.equalToSuperview()
        }
        
        separatorView.backgroundColor = .lp_grayMedium()
    }
}
