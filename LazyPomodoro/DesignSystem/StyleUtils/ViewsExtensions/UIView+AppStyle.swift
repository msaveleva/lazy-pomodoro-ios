//
//  CAGradientLayer +AppStyle.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 03/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: Shadows
    
    func lp_setCenterShadow() {
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1;
        layer.shadowRadius = 5
    }
    
    // MARK: Gradient
    
    func lp_fillWithDefaultGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.lp_mainGradientColors().0.cgColor,
                                UIColor.lp_mainGradientColors().1.cgColor]
        gradientLayer.startPoint = .zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func lp_getGradientLayer() -> CAGradientLayer? {
        guard let sublayers = layer.sublayers else {
            return nil
        }
        
        for layer in sublayers {
            if let resultLayer = layer as? CAGradientLayer {
                return resultLayer
            }
        }
        
        return nil
    }
    
    func lp_clearFromGradient() {
        if let topLayer = layer.sublayers?.first, topLayer is CAGradientLayer {
            topLayer.removeFromSuperlayer()
        }
    }
    
}
