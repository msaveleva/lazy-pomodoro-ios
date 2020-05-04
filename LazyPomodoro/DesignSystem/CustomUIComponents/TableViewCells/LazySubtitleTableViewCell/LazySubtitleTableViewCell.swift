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
    private enum ViewSize {
        static let textContainerHeight: CGFloat = 44.0
        
        static let pickerCollapsedHeight: CGFloat = 0.0
        static let pickerExpandedHeight: CGFloat = 214.0
    }
 
    private let stackView = UIStackView()
    private let textContentView = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    lazy private var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private var viewModel: LazySubtitleTableViewCellConfigurable?
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
        self.viewModel = viewModel
        //TODO: Unsubscribe from previous viewModel's events.
        
        viewModel.titleText.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        
        updateSubtitleText()
        pickerView.selectRow(viewModel.selectedOptionIndex, inComponent: 0, animated: false)
        
        viewModel.isExpanded.distinctUntilChanged().subscribe(onNext: { [weak self] expanded in
            guard let strongSelf = self else { return }

            strongSelf.pickerView.isHidden = !expanded
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        selectionStyle = .none
        
        textContentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .lp_body2()
        titleLabel.textColor = .lp_defaultTextColor()
        
        subtitleLabel.font = .lp_body2()
        subtitleLabel.textColor = .lp_grayDarkest()
        
        pickerView.backgroundColor = .white
        
        textContentView.addSubview(titleLabel)
        textContentView.addSubview(subtitleLabel)
        
        textContentView.snp.makeConstraints { make in
            make.height.equalTo(ViewSize.textContainerHeight).priority(.medium) //Priority is required in this case to avoid conflicts with auto constraints set up by UITableView initially.
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Spacing.s24)
            make.trailing.lessThanOrEqualTo(subtitleLabel.snp.leading).offset(-Spacing.s16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-Spacing.s16)
        }
        
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.addArrangedSubview(textContentView)
        stackView.addArrangedSubview(pickerView)
    }
    
    private func updateSubtitleText() {
        if let viewModel = self.viewModel,
            viewModel.optionsValues.count > viewModel.selectedOptionIndex {
            var text = "\(viewModel.optionsValues[viewModel.selectedOptionIndex])"
            if let suffix = viewModel.customSuffix {
                text += suffix
            }
            
            subtitleLabel.text = text
        } else {
            fatalError("Incorrect selected option index")
        }
    }
}

extension LazySubtitleTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel?.optionsValues.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel?.optionsValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel?.selectedOptionIndex = row
        viewModel?.selectOptionsAtIndex(row)
        updateSubtitleText()
    }
}
