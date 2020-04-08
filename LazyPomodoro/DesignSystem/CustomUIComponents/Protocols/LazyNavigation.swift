//
//  LazyNavigation.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 7.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol LazyNavigation: UINavigationBarDelegate where Self: UIViewController {
    var disposeBag: DisposeBag { get }
}

extension LazyNavigation {
    func setupCustomNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.lp_defaultTextColor(),
            NSAttributedString.Key.font: UIFont.lp_h1Bold()
        ]
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.lp_defaultTextColor(),
            NSAttributedString.Key.font: UIFont.lp_h2Bold()
        ]
        
//        navigationController?.navigationBar.tintColor = UIColor.black
    }
}
