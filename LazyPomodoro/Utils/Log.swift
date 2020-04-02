//
//  Log.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import os

private let subsystem = "dreadnoughtdev.LazyPomodoro"

struct Log {
    static let networking = OSLog(subsystem: subsystem, category: "network")
    static let storage = OSLog(subsystem: subsystem, category: "storage")
    static let ui = OSLog(subsystem: subsystem, category: "ui")
    static let utils = OSLog(subsystem: subsystem, category: "utils")
}
