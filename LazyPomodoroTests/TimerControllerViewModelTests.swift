//
//  TimerControllerViewModelTests.swift
//  LazyPomodoroTests
//
//  Created by Maria Saveleva on 22/07/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RxSwift
@testable import LazyPomodoro
import XCTest


class TimerControllerViewModelTests: XCTestCase {
    func testViewModel() {
        let vm = TimerControllerViewModel()
        vm.databaseService = DatabaseMock()
    }
}

class DatabaseMock: DatabaseServiceProtocol {
    func save(project: Project) -> Completable {
        return Completable.create { [weak self] completable in
            completable(.completed)
            
            
            return Disposables.create()
        }
    }
}

