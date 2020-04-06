//
//  LazyProgressViewConfigurable.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 20/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift

protocol LazyProgressViewConfigurable {
    var title: String { get }
    func getInitialProgressText() -> String
    func progressTextObservable() -> Observable<String?>
    func progressValueObservable() -> Observable<Float>
}
