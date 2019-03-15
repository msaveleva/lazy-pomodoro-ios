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

class ProgressStackViewModel {
    public let title: String
    
    private let type: ProgressViewType
    private let timerService: TimerService
    
    //TODO: create settings service and take this value from there.
    private let intervalDuration: Float = 25 * 60 //duration in seconds.
    
    init(title: String, type: ProgressViewType, timerService: TimerService) {
        self.title = title
        self.type = type
        self.timerService = timerService
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
        return timerService.currentTimerObservable.map(createTimeStringForCurrentInterval)
    }
    
    func progressObservable() -> Observable<Float> {
        return timerService.currentTimerObservable.map(createProgressValue)
    }
    
    private func createProgressValue(with value: Int) -> Float {
        let result = Float(value) / intervalDuration
        return result
    }
    
    private func createTimeStringForCurrentInterval(with value: Int) -> String? {
        switch type {
        case .time:
            let seconds = TimeInterval(value)
            let sec = Int(seconds.truncatingRemainder(dividingBy: 60))
            let min = Int(seconds.truncatingRemainder(dividingBy: 3600) / 60)
            return String(format: "%02d:%02d", min, sec)
        default:
            return String(value)
        }
    }
}
