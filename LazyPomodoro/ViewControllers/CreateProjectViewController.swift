//
//  CreateProjectViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 04/07/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import RxSwift
import os

class CreateProjectViewController: UIViewController, BindableTypeProtocol {
    
    private struct Constant {
        static let defaultCellId = "DefaultCellId"
        
        static let textFieldCellId = "TextFieldCellId"
        static let switchCellId = "SwitchCellId"
        static let numberCellId = "NumberCellId"
    }
    
    private(set) var viewModel: CreateProjectControllerViewModel
    private let disposeBag = DisposeBag()
    
    private let projectCreateBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: nil, action: nil)
    private let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    
    init(viewModel: CreateProjectControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unable to create controller via IB.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lp_mainFillColor()
        title = "New Project"
        setupUI()
    }
    
    func bindViewModel() {
        projectCreateBarButtonItem.rx.tap.subscribe(onNext: { _ in
            os_log("Handling project creation", log: Log.ui, type: .info)
        }).disposed(by: disposeBag)
    }
    
    //MARK: - Private methods
    private func setupUI() {
        navigationItem.rightBarButtonItem = projectCreateBarButtonItem
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.defaultCellId)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}

extension CreateProjectViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionsVMs[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sectionsVMs[section].cells.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.defaultCellId, for: indexPath)
        cell.textLabel?.text = "Hello world!"
        
        return cell
    }
    
}
