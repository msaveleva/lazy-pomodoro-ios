//
//  LazySubtitleTableViewCellConfigurable.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 17.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation
import RxCocoa

protocol LazySubtitleTableViewCellConfigurable: TableViewCellConfigurable {
    var isExpanded: BehaviorRelay<Bool> { get }
    var subtitleText: BehaviorRelay<String> { get }
    var optionsValues: [String] { get }
    var action: () -> Void { get }
}
