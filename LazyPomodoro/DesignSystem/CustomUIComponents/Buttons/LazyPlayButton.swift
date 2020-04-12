//
//  LazyPlayButton.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 12.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit

class LazyPlayButton: UIButton {
    private static let playImage = UIImage(asset: IconAsset.playButton)
    private static let pauseImage = UIImage(asset: IconAsset.pauseButton)
    
    var isPlaying: Bool = false {
        didSet {
            var image: UIImage?
            if isPlaying {
                image = LazyPlayButton.pauseImage
            } else {
                image = LazyPlayButton.playImage
            }
            
            setImage(image, for: .normal)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 72, height: 72)
    }
    
    class func createLazyPlayButton() -> LazyPlayButton {
        let button = LazyPlayButton.init(type: .custom)
        button.setImage(LazyPlayButton.playImage, for: .normal)
        
        return button
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2
        if lp_getGradientLayer() == nil {
            lp_fillWithDefaultGradient()
            lp_getGradientLayer()?.cornerRadius = frame.width / 2
        }
    }
}
