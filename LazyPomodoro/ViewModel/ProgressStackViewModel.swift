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
    case finished
}

class ProgressStackViewModel {
    public let title: String
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
        case .finished:
            resetTimer()
            timerStateType = .inProgress
        }
    }
    
    func getInitialProgressLabel() -> String {
        switch type {
        case .time:
            return "00:00"
        case .part:
            return "0/0" //TODO msaveleva: change
        }
    }
    
    func timerObservable() -> Observable<String?> {
        return timerService.currentTimerObservable
            .map({ [weak self] (value) -> String? in
            if let interval = self?.currentIntervalTime {
                //Do not increase values if timer is on pause or finished.
                var valueToAdd = 0
                if (self?.timerStateType == .inProgress) {
                    valueToAdd = 1
                }
                self?.currentIntervalTime += valueToAdd
                return self?.createTimeStringForCurrentInterval(with: interval + valueToAdd)
            } else {
                assertionFailure("ProtressStackViewModel was deallocated.")
                return nil
            }
        })
    }
    
    func progressObservable() -> Observable<Float> {
        return timerService.currentTimerObservable.map(createProgressValue)
    }
    
    private func createProgressValue(with value: Int) -> Float {
        let result = Float(value) / intervalDuration
        return result
    }
    
    private func createTimeStringForCurrentInterval(with interval: Int) -> String? {
        switch type {
        case .time:
            let seconds = TimeInterval(interval)
            let sec = Int(seconds.truncatingRemainder(dividingBy: 60))
            let min = Int(seconds.truncatingRemainder(dividingBy: 3600) / 60)
            return String(format: "%02d:%02d", min, sec)
        default:
            return String(interval)
        }
    }
    
    private func resetTimer() {
        //TODO msaveleva: implement
    }
}
