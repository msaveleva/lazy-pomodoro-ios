//
//  LazyQuoteViewConfigurable.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 7.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol LazyQuoteViewConfigurable {
    var quoteText: BehaviorRelay<String> { get }
}
