//
//  DemoLazyProgressViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 6.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift

class DemoLazyProgressViewModel: LazyProgressViewConfigurable {
    public let title = "Demo title"
    
    func getInitialProgressText() -> String {
        return "0/3"
    }
    
    func progressTextObservable() -> Observable<String?> {
        return Observable.just("2/3")
    }
    
    func progressValueObservable() -> Observable<Float> {
        return Observable.just(0.65)
    }
}
