//
//  LazyButton.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit

class LazyButton: UIButton {
    private static let kDefaultCornerRadius: CGFloat = 10.0
    
    class func createLazyButton() -> LazyButton {
        let button = LazyButton(type: .system)
        
        button.layer.cornerRadius = kDefaultCornerRadius
        button.backgroundColor = UIColor.lp_mainFillColor()
        button.setTitleColor(UIColor.lp_defaultTextColor(), for: .normal)
        
        button.lp_setCenterShadow()
        
        button.titleLabel?.font = UIFont.lp_body2()
        
        button.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        return button
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor.lp_grayMedium()
            } else {
                backgroundColor = UIColor.lp_mainFillColor()
            }
        }
    }   
}
