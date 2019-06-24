//
//  Project.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 07/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RealmSwift

class Project: Object {
    
    @objc dynamic var name = ""
    let goalPomodoros = RealmOptional<Int>()
    var pomodoros = List<Pomodoro>()
    
}
