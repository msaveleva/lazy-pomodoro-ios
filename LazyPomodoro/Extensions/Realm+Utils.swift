//
//  Realm+Utils.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    
    func toArray() -> [Element] {
        return compactMap {
            $0
        }
    }
    
}
