//
//  SimulationTableViewCell.swift
//  Easynvest
//
//  Created by Developer on 05/08/18.
//

import UIKit

protocol SimulationTableViewCellDelegate: class {
    func endEditingText(identifier: String, textValue: String)
}

class SimulationTableViewCell: UITableViewCell {
    weak var delegate: SimulationTableViewCellDelegate?
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var responseTextField: UITextField!
    var questionIdentifier: String!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.responseTextField.delegate = self
        self.questionLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        self.responseTextField.font = UIFont.preferredFont(forTextStyle: .subheadline)
        self.responseTextField.adjustsFontForContentSizeCategory = true
        self.questionLabel.adjustsFontForContentSizeCategory = true
    }
    func bind(question: QuestionForm) {
        self.questionLabel.text = question.question
        self.responseTextField.placeholder = question.placeholder
        self.questionIdentifier = question.identifier
        if self.questionIdentifier == "maturityDate" {
           self.setupDatePickerKeyboard()
        }
    }
    @objc
    func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.responseTextField.text = dateFormatter.string(from: sender.date)
    }
    func setupDatePickerKeyboard() {
        let datePicker = UIDatePicker()
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.timeZone = TimeZone.current
        datePicker.locale = Locale(identifier: "pt-BR")
        datePicker.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.responseTextField.inputView = datePicker
    }
}

extension SimulationTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        self.delegate?.endEditingText(identifier: self.questionIdentifier, textValue: textField.text ?? "")
    }
}
