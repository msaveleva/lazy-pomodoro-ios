//
//  SubtitleTableViewCellVM.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 17.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SubtitleTableViewCellVM: LazySubtitleTableViewCellConfigurable {
    private(set) var isExpanded = BehaviorRelay<Bool>(value: false)
    
    private(set) var titleText: BehaviorRelay<String>
    
    var selectedOptionIndex: Int
    private(set) var customSuffix: String?
    private(set) var optionsValues: [String]
    
    private(set) var selectOptionsAtIndex: (Int) -> Void

    init(title: String, customSuffix: String? = nil, selectedOptionIndex: Int = 0, optionsValues: [String], selectOptionsAtIndex: @escaping (Int) -> Void) {
        self.titleText = BehaviorRelay<String>(value: title)
        
        self.selectedOptionIndex = selectedOptionIndex
        self.customSuffix = customSuffix
        self.optionsValues = optionsValues
        
        self.selectOptionsAtIndex = selectOptionsAtIndex
    }
    
    func expand(_ expand: Bool) {
        isExpanded.accept(expand)
    }
}
