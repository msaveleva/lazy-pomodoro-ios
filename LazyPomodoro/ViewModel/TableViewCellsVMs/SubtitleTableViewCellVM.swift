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
    private(set) var subtitleText: BehaviorRelay<String>
    private(set) var optionsValues: [String]
    private(set) var selectOptionsAtIndex: (Int) -> Void

    init(title: String, subtitle: String, optionsValues: [String], selectOptionsAtIndex: @escaping (Int) -> Void) {
        self.titleText = BehaviorRelay<String>(value: title)
        self.subtitleText = BehaviorRelay<String>(value: subtitle)
        self.optionsValues = optionsValues
        self.selectOptionsAtIndex = selectOptionsAtIndex
    }
    
    func expand(_ expand: Bool) {
        isExpanded.accept(expand)
    }
}
