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
    
    public var projectPomodoroStackVm: TimerLazyProgressViewModel!
    public var todayProgressStackVm: TodayLazyProgressViewModel!
    public var goalProgressStackVm: GoalLazyProgressViewModel?
    
    public var timerService: TimerService!
    public var databaseService: DatabaseService!
    
    private let disposeBag = DisposeBag()
    
    func dependenciesInjected() {
        projectPomodoroStackVm = TimerLazyProgressViewModel(title: "Default Project", timerService: timerService)
        todayProgressStackVm = TodayLazyProgressViewModel(title: "Progress for today") //TODO msaveleva: change to localized string
        
        //TODO msaveleva: add check if need to create this vm:
//        goalProgressStackVm = GoalLazyProgressViewModel(title: "Project goal", currentProject: project) //TODO msaveleva: change to localized string
    }
    
    func startPauseButtonPressed() {
        projectPomodoroStackVm.updateState()
    }
    
}
