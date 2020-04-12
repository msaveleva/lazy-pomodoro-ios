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

enum ButtonItemPosition {
    case left
    case right
}

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
        
        navigationController?.navigationBar.tintColor = UIColor.lp_defaultTextColor()
    }
    
    func addButtonItem(to position: ButtonItemPosition, image: ImageAsset, completion: @escaping () -> Void) {
        let buttonItem = UIBarButtonItem(
            image: UIImage(asset: image).withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: nil
        )
        
        buttonItem.rx.tap.subscribe(onNext: { _ in
            completion()
        }).disposed(by: disposeBag)
        
        switch position {
        case .left:
            navigationItem.leftBarButtonItem = buttonItem
        case .right:
            navigationItem.rightBarButtonItem = buttonItem
        }
    }
}
