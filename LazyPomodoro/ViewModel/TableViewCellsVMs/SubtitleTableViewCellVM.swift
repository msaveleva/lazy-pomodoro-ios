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
    private(set) var titleText: BehaviorRelay<String>
    private(set) var subtitleText: BehaviorRelay<String>
    private(set) var action: () -> Void

    init(title: String, subtitle: String, action: @escaping () -> Void) {
        self.titleText = BehaviorRelay<String>(value: title)
        self.subtitleText = BehaviorRelay<String>(value: subtitle)
        self.action = action
    }
}
