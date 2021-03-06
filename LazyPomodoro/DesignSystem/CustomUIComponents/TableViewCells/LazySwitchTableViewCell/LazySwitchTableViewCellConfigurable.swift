//
//  LazySwitchTableViewCellConfigurable.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation
import RxCocoa

protocol LazySwitchTableViewCellConfigurable: TableViewCellConfigurable {
    var switchValue: BehaviorRelay<Bool> { get }
    var switchAction: (_ value: Bool) -> Void { get }
}
