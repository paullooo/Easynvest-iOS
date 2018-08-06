//
//  SimulationResultViewController.swift
//  Easynvest
//
//  Created by Developer on 06/08/18.
//

import UIKit

class SimulationResultViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ResultViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableHeaderView = UIView(frame: .zero)
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "detailCell")
        self.tableView.register(UINib(nibName: "ResumeTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "resumeCell")
        self.tableView.register(UINib(nibName: "SubmitTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "submitCell")
    }
}

extension SimulationResultViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        case 2:
            return 6
        case 3:
            return 1
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3 || section == 2 || section == 1 {
            return 50
        }
        return CGFloat.leastNonzeroMagnitude
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "resumeCell", for: indexPath)
            as? ResumeTableViewCell
            cell?.bind(simulation: self.viewModel.simulation)
            return cell ?? ResumeTableViewCell()
        case 1, 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            as? DetailTableViewCell
            cell?.bind(title: self.viewModel.get(at: indexPath).title, value: self.viewModel.get(at: indexPath).value)
            return cell ?? DetailTableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "submitCell", for: indexPath)
            as? SubmitTableViewCell
            return cell ?? SubmitTableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
