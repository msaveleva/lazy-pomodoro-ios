//
//  ProgressStackViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class ProgressStackViewModel {
    public let title: String
    public let subtitle: String
    public let progressValue: Float
    
    init(title: String, subtitle: String, progressValue: Float) {
        self.title = title
        self.subtitle = subtitle
        self.progressValue = progressValue
    }
}
