//
//  StandardButton.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

class StandardButton: UIButton {
    
    private static let kDefaultCornerRadius: CGFloat = 10.0
    
    class func createStandardButton() -> StandardButton {
        let button = StandardButton(type: .system)
        
        button.layer.cornerRadius = kDefaultCornerRadius
        button.backgroundColor = UIColor.lp_mainFillColor()
        button.setTitleColor(UIColor.lp_defaultTextColor(), for: .normal)
        
        button.lp_setCenterShadow()
        
        button.titleLabel?.font = UIFont.lp_body2()
        
        return button
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor.lp_greyMedium()
            } else {
                backgroundColor = UIColor.lp_mainFillColor()
            }
        }
    }
    
}
