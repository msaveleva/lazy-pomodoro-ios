//
//  GoalLazyProgressViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 20/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift

class GoalLazyProgressViewModel: LazyProgressViewConfigurable {
    public let title: String
    private let currentProject: Project
    
    init(title: String, currentProject: Project) {
        self.title = title
        self.currentProject = currentProject
    }
    
    func getInitialProgressText() -> String {
        return String.lp_createStringForProgress(current: 0, total: 0)
    }
    
    func progressTextObservable() -> Observable<String?> {
        return Observable<String?>.create { observer in
            //TODO msaveleva: implement
            return Disposables.create()
        }
    }
    
    func progressValueObservable() -> Observable<Float> {
        return Observable<Float>.create { observer in
            //TODO msaveleva: implement
            return Disposables.create()
        }
    }
}
