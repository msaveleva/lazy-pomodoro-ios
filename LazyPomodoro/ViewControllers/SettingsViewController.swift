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
        static let subtitleCellId = "SubtitleCellId"
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
        tableView.register(LazySubtitleTableViewCell.self, forCellReuseIdentifier: CellId.subtitleCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsVMs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sectionsVMs[section].cellVMs.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionsVMs[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: refactor with common protocol for cells, cells id in viewModels and so on.
        let cellVm = viewModel.sectionsVMs[indexPath.section].cellVMs[indexPath.row]
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.switchCellId, for: indexPath)

            if let switchCell = cell as? LazySwitchTableViewCell,
                let vm = cellVm as? LazySwitchTableViewCellConfigurable {
                switchCell.bind(viewModel: vm)
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.subtitleCellId, for: indexPath)

            if let subtitleCell = cell as? LazySubtitleTableViewCell,
                let vm = cellVm as? LazySubtitleTableViewCellConfigurable {
                subtitleCell.bind(viewModel: vm)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vm =
            viewModel.sectionsVMs[indexPath.section].cellVMs[indexPath.row] as? SubtitleTableViewCellVM {
            vm.isExpanded.accept(!vm.isExpanded.value)
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
