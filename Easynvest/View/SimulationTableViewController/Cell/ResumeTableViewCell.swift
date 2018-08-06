//
//  ResumeTableViewCell.swift
//  Easynvest
//
//  Created by Developer on 03/08/18.
//

import UIKit

class ResumeTableViewCell: UITableViewCell {
    @IBOutlet weak var totalResult: UILabel!
    @IBOutlet weak var profitResult: UILabel!
//    var placeholderProfit: String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func bind(simulation: Simulation) {
        self.totalResult.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt-BR")
        let totalResulFormated = formatter.string(from: simulation.grossAmount as NSNumber)
        self.totalResult.text = totalResulFormated
        let profitResultAttribute = [NSAttributedStringKey.foregroundColor: UIColor.greenEasynvestColor]
        let profitResulFormated = formatter.string(from: simulation.grossAmountProfit as NSNumber)
        let profitValue = NSAttributedString(string: profitResulFormated!, attributes: profitResultAttribute)
        let placeholderProfit = NSMutableAttributedString(string: "Rendimento total de ")
        placeholderProfit.append(profitValue)
        self.profitResult.attributedText = placeholderProfit
    }
}
