//
//  DatabaseService.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 03/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class DatabaseService {
    
    private let realm: Realm
    
    init() {
        if let realm = try? Realm() {
            self.realm = realm
        } else {
            fatalError("Can't instantiate database.")
        }
    }
    
    
    //MARK: - Public methods
    
    func save(pomodoro: Pomodoro) -> Completable {
        return Completable.create { [weak self] completable in
            do {
                try self?.realm.write {
                    self?.realm.add(pomodoro)
                    completable(.completed)
                }
            } catch {
                completable(.error(error))
            }
            
            return Disposables.create()
        }
    }
    
}
