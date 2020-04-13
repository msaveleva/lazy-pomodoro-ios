//
//  SwitchTableViewCell.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class LazySwitchTableViewCell: UITableViewCell {
    private(set) var switcher = UISwitch()
    private(set) var titleLabel = UILabel()
    
    private let disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("IB is not supported.")
    }
    
    // MARK: - Public methods
    func bind(viewModel: LazySwitchTableViewCellConfigurable) {
        viewModel.titleText.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        switcher
            .rx
            .isOn
            .changed //Only user-initiated changes.
            .distinctUntilChanged().subscribe(onNext: { value in
                viewModel.switchAction(value)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        titleLabel.font = .lp_body2()
        titleLabel.textColor = .lp_defaultTextColor()
        switcher.backgroundColor = .lp_fillAccentPeach()
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(switcher)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Spacing.s24)
            make.trailing.lessThanOrEqualTo(switcher.snp.leading)
        }
        
        switcher.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(Spacing.s16)
        }
    }
}
