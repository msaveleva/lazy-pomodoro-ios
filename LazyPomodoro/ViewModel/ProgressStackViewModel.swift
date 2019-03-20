//
//  ProgressStackViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 13/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift

enum ProgressViewType {
    case time
    case part
}

enum TimerStateType {
    case inProgress
    case paused
}

class ProgressStackViewModel: ProgressStackViewModelProtocol {
    public let title: String
    public let timerFinishedSubject = PublishSubject<Bool>()
    public var timerStateType = TimerStateType.paused
    
    private let type: ProgressViewType
    private let timerService: TimerService
    
    //TODO: create settings service and take this value from there.
    private let intervalDuration: Float = 25 * 60 //duration in seconds.
    private var currentIntervalTime = 0
    
    init(title: String, type: ProgressViewType, timerService: TimerService) {
        self.title = title
        self.type = type
        self.timerService = timerService
    }
    
    func updateState() {
        switch timerStateType {
        case .inProgress:
            timerStateType = .paused
        case .paused:
            timerStateType = .inProgress
        }
    }
    
    func getInitialProgressText() -> String {
        switch type {
        case .time:
            return String.lp_createTimeStringForCurrentInterval(with: 0)
        case .part:
            return "0/0" //TODO msaveleva: change
        }
    }
    
    func progressTextObservable() -> Observable<String?> {
        return timerService.currentTimerObservable
            .map({ [unowned self] (value) -> String? in
            if self.shouldStopAndResetTimer() {
                self.resetTimer()
            }
            
            //Do not increase values if timer is on pause or finished.
            var valueToAdd = 0
            if (self.timerStateType == .inProgress) {
                valueToAdd = 1
            }
                
            self.currentIntervalTime += valueToAdd
                
            return String.lp_createTimeStringForCurrentInterval(with: self.currentIntervalTime)
        })
    }
    
    func progressValueObservable() -> Observable<Float> {
        return timerService.currentTimerObservable.map(createProgressValue)
    }
    
    private func createProgressValue(with _: Int) -> Float {
        let result = Float(currentIntervalTime) / intervalDuration
        return result
    }
    
    private func shouldStopAndResetTimer() -> Bool {
        return Float(currentIntervalTime) >= intervalDuration
    }
    
    private func resetTimer() {
        currentIntervalTime = 0
        timerStateType = .paused
        
        timerFinishedSubject.onNext(true)
    }
}
