//
//  TimerService.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift

class TimerService {
    private(set) var currentTimerObservable: Observable<Int>
    
    init() {
        currentTimerObservable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
    }
}
