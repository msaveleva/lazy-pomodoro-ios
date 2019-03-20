//
//  TimerControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift

class TimerControllerViewModel: ViewModelProtocol {
    private var project: Project!
    
    public var projectPomodoroStackVm: TimerProgressStackViewModel!
    public var todayProgressStackVm: TodayProgressStackViewModel!
    public var goalProgressStackVm: GoalProgressStackViewModel?
    
    public var timerService: TimerService!
    
    func dependenciesInjected() {
        projectPomodoroStackVm = TimerProgressStackViewModel(title: "Default Project", timerService: timerService)
        todayProgressStackVm = TodayProgressStackViewModel(title: "Progress for today") //TODO msaveleva: change to localized string
        
        //TODO msaveleva: add check if need to create this vm:
        goalProgressStackVm = GoalProgressStackViewModel(title: "Project goal") //TODO msaveleva: change to localized string
    }
    
    func getCurrentProjectName() -> String {
        return project.name
    }
    
    func startPauseButtonPressed() {
        projectPomodoroStackVm.updateState()
    }
}
