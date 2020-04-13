//
//  LazySwitchTableViewCellConfigurable.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation

protocol LazySwitchTableViewCellConfigurable {
    var titleText: BehaviorRelay<String> { get }
    var switchAction: (_ value: Bool) -> Void { get }
}
