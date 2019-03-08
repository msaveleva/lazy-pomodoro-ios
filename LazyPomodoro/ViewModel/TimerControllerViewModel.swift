//
//  TimerControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class TimerControllerViewModel {
    private var project: Project!
    
    func currentProjectName() -> String {
        return project.name
    }
    
    func showProjectGoal() -> Bool {
        return project.goalPomodoros != nil
    }
}
