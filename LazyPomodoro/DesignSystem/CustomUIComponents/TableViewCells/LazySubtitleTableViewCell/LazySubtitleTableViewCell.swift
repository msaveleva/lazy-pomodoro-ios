//
//  LazySubtitleTableViewCell.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 17.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class LazySubtitleTableViewCell: UITableViewCell {
    private(set) var titleLabel = UILabel()
    private(set) var subtitleLabel = UILabel()
    
    private let disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("IB is not supported.")
    }
    
    // MARK: - Public methods
    func bind(viewModel: LazySubtitleTableViewCellConfigurable) {
        //TODO: Unsubscribe from previous viewModel's events.
        
        viewModel.titleText.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.subtitleText.bind(to: subtitleLabel.rx.text).disposed(by: disposeBag)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        titleLabel.font = .lp_body2()
        titleLabel.textColor = .lp_defaultTextColor()
        
        subtitleLabel.font = .lp_body2()
        subtitleLabel.textColor = .lp_grayDarkest()
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Spacing.s24)
            make.trailing.lessThanOrEqualTo(subtitleLabel.snp.leading).offset(-Spacing.s16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-Spacing.s16)
        }
    }
}
