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
    
    private let label = UILabel()
    private let progressIndicator = UIProgressView()
    
    class func createDefaultProgressView() -> RedProgressView {
        let progressView = RedProgressView(frame: CGRect(x: 0, y: 0, width: 311, height: 28))
        
        //Configure progress label
        progressView.label.font = UIFont.lp_body2()
        progressView.label.textColor = UIColor.lp_grayDarkest()
        progressView.label.textAlignment = .right
        
        progressView.addSubview(progressView.label)
        progressView.label.snp.makeConstraints { (make) in
            make.top.right.equalTo(progressView)
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
