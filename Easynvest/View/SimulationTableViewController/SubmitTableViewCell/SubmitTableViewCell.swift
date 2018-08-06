//
//  SubmitTableViewCell.swift
//  Easynvest
//
//  Created by Developer on 05/08/18.
//

import UIKit

protocol SubmitTableViewCellDelegate: class {
    func submitButtonPressed()
}

class SubmitTableViewCell: UITableViewCell {
    weak var delegate: SubmitTableViewCellDelegate?
    @IBOutlet weak var submitButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.configutationButton()
        self.submitButton.isEnabled = false
    }
    func configutationButton() {
        self.submitButton.setTitle("Simular", for: .normal)
        self.submitButton.backgroundColor = .greyEasynvestColor
        self.submitButton.tintColor = .white
        self.submitButton.layer.cornerRadius = self.submitButton.frame.height / 2
    }
    @IBAction func submitButtonPressed(_ sender: Any) {
        delegate?.submitButtonPressed()
    }
}
