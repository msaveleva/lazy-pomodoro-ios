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
    var goalPomodoros: UInt?
    
    init(name: String, goalPomodoros: UInt?) {
        self.name = name
        self.goalPomodoros = goalPomodoros
    }
}
