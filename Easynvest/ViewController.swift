//
//  ViewController.swift
//  Easynvest
//
//  Created by Developer on 03/08/18.
//

import UIKit

class ViewController: UIViewController, SimulationServiceDelegate {
    func simulationSuccess() {
        print("oi")
    }
    func simulationFailure(error: String) {
        print("tchau")
    }
    
    var service: SimulationService!

    @IBOutlet weak var valueQuestionLabel: UILabel!
    @IBOutlet weak var timeQuestionLabel: UILabel!
    @IBOutlet weak var cdiPercentQuestionLabel: UILabel!
    @IBOutlet weak var simulationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = SimulationService(delegate: self)
        valueQuestionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        valueQuestionLabel.adjustsFontForContentSizeCategory = true
        timeQuestionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        timeQuestionLabel.adjustsFontForContentSizeCategory = true
        cdiPercentQuestionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        cdiPercentQuestionLabel.adjustsFontForContentSizeCategory = true
        simulationButton.backgroundColor = UIColor .greenEasynvestColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func simulationAction(_ sender: Any) {
        let params = ["investedAmount": "32323.0", "index": "CDI", "rate": "123", "isTaxFree": "false", "maturityDate": "2023-03-03"] as Dictionary<String, AnyObject>
        self.service.getSimulationResult(params: (params as? [String: String])!)
    }
}
