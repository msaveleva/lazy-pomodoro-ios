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
    
    public var projectPomodoroStackVm: ProgressStackViewModel!
    public var progressForTodayStackVm: ProgressStackViewModel!
    public var projectGoalStackVm: ProgressStackViewModel?
    
    public var timerService: TimerService!
    
    func dependenciesInjected() {
        projectPomodoroStackVm = ProgressStackViewModel(title: "Default Project", type: .time, timerService: timerService)
    }
    
    func getCurrentProjectName() -> String {
        return project.name
    }
    
    func startPauseButtonPressed() {
        projectPomodoroStackVm.updateState()
    }
}
