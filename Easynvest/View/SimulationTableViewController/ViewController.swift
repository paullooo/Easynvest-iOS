//
//  ViewController.swift
//  Easynvest
//
//  Created by Developer on 03/08/18.
//

import UIKit

class ViewController: UIViewController {
    var service: SimulationService!
    var questions: [QuestionForm] = []
    var simulationFields: [String: String] = [:]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = SimulationService(delegate: self)
        self.configurationTableView()
        self.questions = Form.getSimulationQuestions()
    }
    override func viewWillLayoutSubviews() {
        //self.updateTableViewContentInset()
    }
    func configurationTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //essa porcaria poderia ser evitada utilizando o reusable
        self.tableView.register(UINib(nibName: "SimulationTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "questionCell")
        self.tableView.register(UINib(nibName: "SubmitTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "submitCell")
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }
    func updateTableViewContentInset() {
        let viewHeight: CGFloat = view.frame.size.height
        let tableViewContentHeight: CGFloat = tableView.contentSize.height
        let marginHeight: CGFloat = (viewHeight - tableViewContentHeight) / 3.0
        let test = max(0, marginHeight)
        self.tableView.contentInset = UIEdgeInsets(top: test, left: 0, bottom: -test, right: 0)
    }
    func convertDateFormater(_ date: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        let showDate = inputFormatter.date(from: date)
        inputFormatter.dateFormat = "yyyy-MM-dd"
        return  inputFormatter.string(from: showDate!)
    }
}

extension ViewController: SimulationServiceDelegate {
    func simulationSuccess() {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    func simulationFailure(error: String) {
        print("tchau")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == questions.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "submitCell", for: indexPath)
            as? SubmitTableViewCell
            cell?.delegate = self
            return cell ?? SubmitTableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath)
            as? SimulationTableViewCell
            cell?.delegate = self
            cell?.bind(question: self.questions[indexPath.row])
            return cell ?? SimulationTableViewCell()
        }
    }
}

extension ViewController: SimulationTableViewCellDelegate {
    func endEditingText(identifier: String, textValue: String) {
        if identifier == "maturityDate" {
           self.simulationFields[identifier] = self.convertDateFormater(textValue)
        } else {
        self.simulationFields[identifier] = textValue
        }
    }
}

extension ViewController: SubmitTableViewCellDelegate {
    func submitButtonPressed() {
        self.view.endEditing(true)
        self.simulationFields["index"] = "CDI"
        self.simulationFields["isTaxFree"] = "false"
        self.service.getSimulationResult(params: self.simulationFields)
    }
}
