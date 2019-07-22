//
//  TimerControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 05/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift
import os

class TimerControllerViewModel: ViewModelProtocol {
    //TODO: load value from storage.
//    private var project: Project = Project(name: "Personal Project", currentPomodoroIntervals: 2, goalPomodoroIntervals: 15)
    
    public var projectPomodoroStackVm: TimerProgressStackViewModel!
    public var todayProgressStackVm: TodayProgressStackViewModel!
    public var goalProgressStackVm: GoalProgressStackViewModel?
    
    public var timerService: TimerService!
    public var databaseService: DatabaseServiceProtocol!
    
    private let disposeBag = DisposeBag()
    
    func dependenciesInjected() {
        projectPomodoroStackVm = TimerProgressStackViewModel(title: "Default Project", timerService: timerService)
        todayProgressStackVm = TodayProgressStackViewModel(title: "Progress for today") //TODO msaveleva: change to localized string
        
        //TODO msaveleva: add check if need to create this vm:
//        goalProgressStackVm = GoalProgressStackViewModel(title: "Project goal", currentProject: project) //TODO msaveleva: change to localized string
    }
    
    func startPauseButtonPressed() {
        projectPomodoroStackVm.updateState()
    }
    
}
