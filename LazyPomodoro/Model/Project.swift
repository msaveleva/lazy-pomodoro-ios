//
//  Project.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 07/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RealmSwift

class Project {
    
    @objc dynamic var name = ""
    @objc dynamic var pomodoros = [Pomodoro]()
    @objc dynamic var goalPomodoros: NSNumber? = nil
    
}
