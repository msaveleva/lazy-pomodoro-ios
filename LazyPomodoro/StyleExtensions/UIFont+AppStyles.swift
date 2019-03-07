//
//  UIFont+AppStyles.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 03/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func lp_h2Bold() -> UIFont {
        return UIFont.systemFont(ofSize: 24.0, weight: .bold)
    }
    
    class func lp_body1() -> UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    class func lp_body1Semibold() -> UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    }
    
    class func lp_body2() -> UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }
    
    class func lp_body3() -> UIFont {
        return UIFont.systemFont(ofSize: 10.0, weight: .regular)
    }
    
}
