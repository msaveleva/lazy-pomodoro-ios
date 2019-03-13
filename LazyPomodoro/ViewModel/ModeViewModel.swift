//
//  ModeViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class ModeViewModel {
    public let title: String
    public let duration: Int
    public var enabled: Bool
    
    init(title: String, duration: Int, enabled: Bool) {
        self.title = title
        self.duration = duration
        self.enabled = enabled
    }
}
