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

struct TimersServicesContainer {
    let timerService: TimerService
    let databaseService: DatabaseService
}

enum TimerType {
    case work, shortBreak, longBreak
}

class CurrentTimer {
    private(set) var value: TimeInterval
    private(set) var type: TimerType
    private(set) var inProgress: Bool
    
    init() {
        self.value = 0
        self.type = .work
        self.inProgress = false
    }
    
    func update(value: TimeInterval) {
        self.value = value
    }
    
    func update(type: TimerType) {
        self.type = type
    }
    
    func update(inProgress: Bool) {
        self.inProgress = inProgress
    }
}

protocol TimerViewControllerConfigurable where Self: ViewModelProtocol {
    var projectPomodoroStackVm: LazyProgressViewConfigurable! { get }
    var todayProgressStackVm: LazyProgressViewConfigurable! { get }
    
    init(with container: TimersServicesContainer)
    func startPauseButtonPressed()
}

class TimerControllerViewModel: TimerViewControllerConfigurable {
    private let container: TimersServicesContainer
    
    private(set) var projectPomodoroStackVm: LazyProgressViewConfigurable!
    private(set) var todayProgressStackVm: LazyProgressViewConfigurable!
    private(set) var goalProgressStackVm: LazyProgressViewConfigurable?
    
    private let disposeBag = DisposeBag()
    
    required init(with container: TimersServicesContainer) {
        self.container = container
        
        dependenciesInjected()
    }
    
    // MARK: - Public methods
    func startPauseButtonPressed() {
        projectPomodoroStackVm.updateState()
    }
}

extension TimerControllerViewModel {
    func dependenciesInjected() {
        projectPomodoroStackVm = TimerLazyProgressViewModel(title: "Default Project",
                                                            timerService: container.timerService)
        todayProgressStackVm = TodayLazyProgressViewModel(title: "Progress for today")
    }
}
