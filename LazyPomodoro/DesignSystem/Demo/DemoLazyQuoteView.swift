//
//  DemoLazyQuoteView.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 7.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class DemoLazyQuoteViewModel: LazyQuoteViewConfigurable {
    private(set) var quoteText = BehaviorRelay<String>(value: "You only live once, but if you do it right, once is enough.")
}
