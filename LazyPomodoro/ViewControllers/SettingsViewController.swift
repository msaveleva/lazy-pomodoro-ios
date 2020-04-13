//
//  SettingsViewController.swift
//  LazyPomodoro
//
//  Created by Maria Saveleva on 02/06/2019.
//  Copyright © 2019 Maria Saveleva. All rights reserved.
//

import UIKit
import RxSwift

class SettingsViewController: UIViewController, BindableTypeProtocol, LazyNavigation {
    private enum CellId {
        static let switchCellId = "SwitchCellId"
    }
    
    private(set) var disposeBag = DisposeBag()

    private(set) var viewModel: SettingsViewControllerConfigurable
    
    private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    init(viewModel: SettingsViewControllerConfigurable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unable to create controller via IB.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomNavigationBar()
        setupUI()
        
        bindViewModel()
    }
    
    func bindViewModel() {
        title = "Settings" //TODO: take from VM
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.lp_mainFillColor()
        
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(LazySwitchTableViewCell.self, forCellReuseIdentifier: CellId.switchCellId)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.baseSettingsVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.switchCellId, for: indexPath)
        
        if let switchCell = cell as? LazySwitchTableViewCell {
            let cellVm = viewModel.baseSettingsVMs[indexPath.row]
            switchCell.bind(viewModel: cellVm)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionsTitles[section]
    }
}
