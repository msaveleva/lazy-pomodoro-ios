//
//  TableViewSectionVM.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 10/07/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class TableViewSectionVM {
    let title: String
    let cells: [TableViewCellVMProtocol]
    
    init(title: String, cells: [TableViewCellVMProtocol]) {
        self.title = title
        self.cells = cells
    }
}

protocol TableViewCellVMProtocol {
    
}

class TableViewCellVM: TableViewCellVMProtocol {
    let title: String
    
    init(with title: String) {
        self.title = title
    }
}


//MARK: - Children
class TextFieldCellVM: TableViewCellVMProtocol {
    let placeholder: String
    var inputText = ""
    
    init(placeholder: String) {
        self.placeholder = placeholder
    }
}

class SwitchCellVM: TableViewCellVM {
    var isSwitchOn = false
}

class NumberCellVM: TableViewCellVM {
    var number: Int
    
    init(with title: String, number: Int = 0) {
        self.number = number
        super.init(with: title)
    }
}
