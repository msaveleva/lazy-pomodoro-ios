//
//  CreateProjectControllerViewModel.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/07/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import Foundation

class CreateProjectControllerViewModel: ViewModelProtocol {
    
    private(set) var sectionsVMs = [TableViewSectionVM]()
    private let scenesRouter: ScenesRouter
    
    init(scenesRouter: ScenesRouter) {
        self.scenesRouter = scenesRouter
    }
    
    func dependenciesInjected() {
        setupViewModel()
    }
    
    //MARK: - Private methods
    private func setupViewModel() {
        let firstTitle = "Project name"
        let textCellVM = TextFieldCellVM(placeholder: "Enter name")
        let firstSection = TableViewSectionVM(title: firstTitle.uppercased(), cells: [textCellVM])
        
        let secondTitle = "Goals"
        let enableGoalCellVM = SwitchCellVM(with: "Enable Project Goal")
        let numberCellVM = NumberCellVM(with: "Number of Interevals")
        let secondSection = TableViewSectionVM(title: secondTitle, cells: [enableGoalCellVM, numberCellVM])
        
        sectionsVMs.append(firstSection)
        sectionsVMs.append(secondSection)
    }
    
}
