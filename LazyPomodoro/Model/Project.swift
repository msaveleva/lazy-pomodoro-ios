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
    var projectPomodoroIntervals: UInt
    var goalPomodoroIntervals: UInt?
    
    init(name: String, projectPomodoroIntervals: UInt, goalPomodoroIntervals: UInt?) {
        self.name = name
        self.projectPomodoroIntervals = projectPomodoroIntervals
        self.goalPomodoroIntervals = goalPomodoroIntervals
    }
}
