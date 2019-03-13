//
//  BindableController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 06/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

protocol BindableTypeProtocol {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType { get }
    func bindViewModel()
}

