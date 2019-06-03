//
//  Project.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 07/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

//TODO msaveleva: support Realm
struct Project {
    let name: String
    let pomodoros: UInt
    let goalPomodoros: UInt?
}
