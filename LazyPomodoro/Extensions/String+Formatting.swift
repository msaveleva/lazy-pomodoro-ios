//
//  String+formatting.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 20/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

extension String {
    public static func lp_createTimeStringForCurrentInterval(with interval: Int) -> String {
        let seconds = TimeInterval(interval)
        let sec = Int(seconds.truncatingRemainder(dividingBy: 60))
        let min = Int(seconds.truncatingRemainder(dividingBy: 3600) / 60)
        return String(format: "%02d:%02d", min, sec)
    }
    
    public static func lp_createStringForProgress(current: UInt, total: UInt) -> String {
        return "\(current)/\(total)"
    }
}
