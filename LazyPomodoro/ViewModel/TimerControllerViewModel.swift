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
    public var progressForTodayStackVm: TimerProgressStackViewModel!
    public var projectGoalStackVm: TimerProgressStackViewModel?
    
    public var timerService: TimerService!
    
    func dependenciesInjected() {
        projectPomodoroStackVm = TimerProgressStackViewModel(title: "Default Project", type: .time, timerService: timerService)
    }
    
    func getCurrentProjectName() -> String {
        return project.name
    }
    
    func startPauseButtonPressed() {
        projectPomodoroStackVm.updateState()
    }
}
