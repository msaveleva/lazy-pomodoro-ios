//
//  GoalProgressStackViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 20/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift

class GoalProgressStackViewModel: ProgressStackViewModelProtocol {
    public let title: String
    
    init(title: String) { //TODO msaveleva: init with additional services to read values from saves settings.
        self.title = title
    }
    
    func getInitialProgressText() -> String {
        return "0/0" //TODO msaveleva: implement
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
