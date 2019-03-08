//
//  RedProgressView.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/03/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import SnapKit

class RedProgressView: UIView {
    
    private static let kProgressIndicatorHeight = 5
    
    private let titleLabel = UILabel()
    private let progressLabel = UILabel()
    private let progressIndicator = UIProgressView()
    
    class func createDefaultProgressView() -> RedProgressView {
        let progressView = RedProgressView(frame: CGRect(x: 0, y: 0, width: 311, height: 28))
        
        //Configure title
        progressView.titleLabel.font = UIFont.lp_body1()
        progressView.titleLabel.textColor = UIColor.lp_defaultTextColor()
        progressView.titleLabel.textAlignment = .left
        
        progressView.addSubview(progressView.titleLabel)
        progressView.titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalTo(progressView)
        }
        
        //Configure progress label
        progressView.progressLabel.font = UIFont.lp_body2()
        progressView.progressLabel.textColor = UIColor.lp_grayDarkest()
        progressView.progressLabel.textAlignment = .right
        
        progressView.addSubview(progressView.progressLabel)
        progressView.progressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(progressView.titleLabel.snp.bottom)
            make.leading.trailing.equalTo(progressView)
        }
        
        //Configure indicator
        progressView.addSubview(progressView.progressIndicator)
        progressView.progressIndicator.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(progressView)
            make.height.equalTo(kProgressIndicatorHeight)
        }
        
        progressView.progressIndicator.trackImage = UIImage(named: "slider-bg")
        progressView.progressIndicator.progressImage = UIImage(named: "slider-fill")
        
        return progressView
    }
    
    //TODO msaveleva: add viewModel and bindViewModel
    
}
