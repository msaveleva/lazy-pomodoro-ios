//
//  Project.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 07/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

//TODO msaveleva: support Realm
class Project {
    var name: String
    var currentPomodoroIntervals: UInt
    var goalPomodoroIntervals: UInt?
    
    init(name: String, currentPomodoroIntervals: UInt, goalPomodoroIntervals: UInt?) {
        self.name = name
        self.currentPomodoroIntervals = currentPomodoroIntervals
        self.goalPomodoroIntervals = goalPomodoroIntervals
    }
}
