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
