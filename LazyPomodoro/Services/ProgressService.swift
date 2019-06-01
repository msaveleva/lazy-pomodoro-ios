//
//  ProgressService.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 22/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift

class ProgressService {
//    var dailyIntervalGoal: UInt!
//    var completedIntervals: UInt!
    
    private var dailyIntervalGoalSubject: BehaviorSubject<Int>?
    
    func getDailyIntervalGoalSubject(for project: Project) -> BehaviorSubject<Int> {
        if let dailySubject = dailyIntervalGoalSubject {
            return dailySubject
        } else {
            let subject = BehaviorSubject(value: getDailyIntervalGoalFromStorage(for: project))
            dailyIntervalGoalSubject = subject
            return subject
        }
    }
    
    private func getDailyIntervalGoalFromStorage(for project: Project) -> Int {
        //TODO msaveleva: implement
        return 9
    }
    
    private func getCompletedIntervalGoalFromStorage(for project: Project) -> Int {
        return 4
    }
}
