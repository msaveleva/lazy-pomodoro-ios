//
//  Pomodoro.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 03/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RealmSwift

class Pomodoro: Object {
    @objc dynamic var date = Date()
    @objc dynamic var duration = 0.0
}
