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
    
    func getCurrentProjectName() -> String {
        return project.name
    }
    
    func getCurrentProjectGoal() -> String? {
        //TODO msaveleva: implement if exists comparing with what is done
        return ""
    }
    
    func getProgressForToday() -> String {
        //TODO msaveleva: implement comparing with daily goal
        return ""
    }
    
    func getMotivationQuote() -> String? {
        //TODO msaveleva: implement
        return ""
    }
}
