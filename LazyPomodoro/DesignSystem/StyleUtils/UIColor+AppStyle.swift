//
//  UIColor+AppStyle.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 03/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

public extension UIColor {
    
    // MARK: Fill
    
    class func lp_mainFillColor() -> UIColor {
        return UIColor.white
    }
    
    class func lp_mainGradientColors() -> (UIColor, UIColor) {
        return (UIColor(hex: 0xFF0844), UIColor(hex: 0xFFB199))
    }
    
    class func lp_fillAccentRed() -> UIColor {
        return UIColor(hex: 0xFF0844)
    }
    
    class func lp_fillAccentPeach() -> UIColor {
        return UIColor(hex: 0xFF5A6E)
    }
    
    //MARK: Gray
    
    class func lp_grayDarkest() -> UIColor {
        return UIColor(hex: 0x9B9B9B)
    }
    
    class func lp_grayDark() -> UIColor {
        return UIColor(hex: 0xE0E0E0)
    }
    
    class func lp_grayMedium() -> UIColor {
        return UIColor(hex: 0xF2F2F2)
    }
    
    class func lp_grayLight() -> UIColor {
        return UIColor(hex: 0xF7F7F7)
    }
    
    // MARK: Text
    
    class func lp_defaultTextColor() -> UIColor {
        return UIColor(hex: 0x333333)
    }
    
}

private extension UIColor {
    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1.0)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(hex & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
