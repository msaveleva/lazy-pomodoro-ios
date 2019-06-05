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
    
    func loadPomodoros() -> Single<[Pomodoro]> {
        return Single.create { [weak self] single in
            if let pomodoros = self?.realm.objects(Pomodoro.self).toArray() {
                single(.success(pomodoros))
            } else {
                single(.success([Pomodoro]()))
            }
            
            return Disposables.create()
        }
    }
    
    func loadTodaysPomodoros() -> Single<[Pomodoro]> {
        return Single.create { [weak self] single in
            let calendar = Calendar.current
            let fromDate = calendar.startOfDay(for: Date()) as NSDate
            
            let todayPredicate = NSPredicate(format: "date >= %@", fromDate)
            if let pomodoros = self?.realm.objects(Pomodoro.self).filter(todayPredicate).toArray() {
                single(.success(pomodoros))
            } else {
                single(.success([Pomodoro]()))
            }
            
            return Disposables.create()
        }
    }
    
}
