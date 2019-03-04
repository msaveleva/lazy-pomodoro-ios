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
        
        let progress = RedProgressView.createDefaultProgressView()
        view.addSubview(progress)
        progress.snp.makeConstraints { (make) in
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.centerY.equalTo(view)
            make.height.equalTo(30)
        }
    }

}

