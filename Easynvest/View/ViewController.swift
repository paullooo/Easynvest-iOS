//
//  ViewController.swift
//  Easynvest
//
//  Created by Developer on 03/08/18.
//

import UIKit

class ViewController: UIViewController {
    var service: SimulationService!
    var questions: [QuestionForm]!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = SimulationService(delegate: self)
        self.configurationTableView()
        self.questions = Form.getSimulationQuestions()
    }
    func configurationTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //essa porcaria poderia ser evitada utilizando o reusable
        self.tableView.register(UINib(nibName: "SimulationTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "questionCell")
        self.tableView.register(UINib(nibName: "SubmitTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "submitCell")
    }
}

extension ViewController: SimulationServiceDelegate {
    func simulationSuccess() {
        print("oi")
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
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "submitCell", for: indexPath)
            as? SubmitTableViewCell
            return cell ?? SubmitTableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath)
            as? SimulationTableViewCell
            cell?.bind(question: self.questions[indexPath.row])
            return cell ?? SimulationTableViewCell()
        }
    }
}
