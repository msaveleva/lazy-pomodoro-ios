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
        let calendar = Calendar.current
        let fromDate = calendar.startOfDay(for: Date()) as NSDate
        
        let predicate = NSPredicate(format: "date >= %@", fromDate)
        return loadPomodoros(with: predicate)
    }
    
    func loadThisWeekPomodoros() -> Single<[Pomodoro]> {
        let calendar = Calendar.current
        let fromDate = Date()
        guard let toDate = calendar.date(byAdding: .day, value: -7, to: fromDate) else {
            fatalError("Can't receive the correct date.")
        }
        
        let predicate = NSPredicate(format: "date <= %@ && date >= %@", fromDate as NSDate, toDate as NSDate)
        return loadPomodoros(with: predicate)
    }
    
    func loadThisMonthPomodoros() -> Single<[Pomodoro]> {
        let fromDate = Date()
        guard let startOfTheMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: fromDate))) else {
            fatalError("Can't receive the correct date.")
        }
        
        let predicate = NSPredicate(format: "date <= %@ && date >= %@", fromDate as NSDate, startOfTheMonth as NSDate)
        return loadPomodoros(with: predicate)
    }
    
    //MARK: - Private methods
    
    private func loadPomodoros(with predicate: NSPredicate) -> Single<[Pomodoro]> {
        return Single.create { [weak self] single in
            if let pomodoros = self?.realm.objects(Pomodoro.self).filter(predicate).toArray() {
                single(.success(pomodoros))
            } else {
                single(.success([Pomodoro]()))
            }
            
            return Disposables.create()
        }
    }
    
}
