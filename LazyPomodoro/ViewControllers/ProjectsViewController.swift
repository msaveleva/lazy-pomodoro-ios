//
//  ProjectsViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 02/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, BindableTypeProtocol {

    private(set) var viewModel: ProjectsControllerViewModel
    
    init(viewModel: ProjectsControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unable to create controller via IB.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lp_mainFillColor()
        title = "Projects"
    }
    
    func bindViewModel() {
        //TODO msaveleva: implement
    }

}
