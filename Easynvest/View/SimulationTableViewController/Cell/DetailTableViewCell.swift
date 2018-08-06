//
//  DetailTableViewCell.swift
//  Easynvest
//
//  Created by Developer on 03/08/18.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var titke: UILabel!
    @IBOutlet weak var value: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func bind(title: String, value: String) {
        self.titke.text = title
        self.value.text = value
    }
}
