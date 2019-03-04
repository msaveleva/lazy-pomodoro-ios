//
//  ViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 03/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let myView = UIView()
//        myView.backgroundColor = UIColor.white
//        myView.layer.cornerRadius = 40.0
//        myView.lp_setCenterShadow()
//
//        view.addSubview(myView)
//        myView.snp.makeConstraints { (make) in
//            make.center.equalTo(view)
//            make.height.width.equalTo(200)
//        }
        
        let button = StandardButton.createStandardButton()
        button.setTitle("Japanese", for: .normal)
        view.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.width.height.equalTo(150)
        }
    }

}

