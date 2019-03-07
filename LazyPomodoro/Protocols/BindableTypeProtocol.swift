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
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension BindableTypeProtocol where Self: UIViewController {
    mutating func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}

