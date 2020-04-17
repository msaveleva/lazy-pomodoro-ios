//
//  SwitchTableViewCellVM.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SwitchTableViewCellVM: LazySwitchTableViewCellConfigurable {
    private(set) var titleText: BehaviorRelay<String>
    private(set) var switchAction: (Bool) -> Void
    
    init(text: String, switchAction: @escaping (Bool) -> Void) {
        self.titleText = BehaviorRelay<String>(value: text)
        self.switchAction = switchAction
    }
}
