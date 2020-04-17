//
//  TableViewCellConfigurable.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 17.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation
import RxCocoa

/**
 Protocol for table view cells.
 */
protocol TableViewCellConfigurable {
    var titleText: BehaviorRelay<String> { get }
}
