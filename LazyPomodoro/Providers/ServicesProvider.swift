//
//  ServiceProvider.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class ServicesProvider {
    
    private(set) var timerService: TimerService
    
    init() {
        timerService = TimerService()
    }
    
}
