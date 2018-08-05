//
//  SimulationTableViewCell.swift
//  Easynvest
//
//  Created by Developer on 05/08/18.
//

import UIKit

class SimulationTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var responseTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.questionLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        self.responseTextField.font = UIFont.preferredFont(forTextStyle: .subheadline)
        self.responseTextField.adjustsFontForContentSizeCategory = true
        self.questionLabel.adjustsFontForContentSizeCategory = true
    }
    func bind(question: QuestionForm) {
        self.questionLabel.text = question.question
        self.responseTextField.placeholder = question.placeholder
    }
}
