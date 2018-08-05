//
//  SubmitTableViewCell.swift
//  Easynvest
//
//  Created by Developer on 05/08/18.
//

import UIKit

class SubmitTableViewCell: UITableViewCell {
    @IBOutlet weak var submitButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.configutationButton()
    }
    func configutationButton() {
        self.submitButton.backgroundColor = .greenEasynvestColor
        self.submitButton.tintColor = .white
        self.submitButton.layer.cornerRadius = self.submitButton.frame.height / 2
    }
}
