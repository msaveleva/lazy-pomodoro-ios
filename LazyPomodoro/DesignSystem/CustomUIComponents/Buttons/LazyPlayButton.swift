//
//  LazyPlayButton.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 12.4.2020.
//  Copyright © 2020 Maria Saveleva. All rights reserved.
//

import UIKit

class LazyPlayButton: UIButton {
    private static let playImage = UIImage(asset: IconAsset.playButton)
    private static let pauseImage = UIImage(asset: IconAsset.pauseButton)
    
    var isPlaying: Bool = false {
        didSet {
            let image = isPlaying ? LazyPlayButton.pauseImage : LazyPlayButton.playImage
            setImage(image, for: .normal)
        }
    }
    
    class func createLazyPlayButton() -> LazyPlayButton {
        let button = LazyPlayButton.init(type: .system)
        button.lp_fillWithDefaultGradient()
        button.setImage(LazyPlayButton.playImage, for: .normal)
        
        return button
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2
    }
}
