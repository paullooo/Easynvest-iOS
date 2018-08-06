//
//  ResultViewModel.swift
//  Easynvest
//
//  Created by Developer on 06/08/18.
//

import Foundation

class ResultViewModel {
    var simulation: Simulation!
    func get(at index: IndexPath) -> (title: String, value: String) {
        if index.section == 1 {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "pt-BR")
            switch index.row {
            case 0:
                let resulFormated = formatter.string(from: self.simulation.investmentParameter.investedAmount as NSNumber)
                return ("Valor Aplicado inicialmente", resulFormated!)
            case 1:
                let resulFormated = formatter.string(from: self.simulation.grossAmount as NSNumber)
                return ("Valor Bruto do investimento", resulFormated!)
            case 2:
                let resulFormated = formatter.string(from: self.simulation.grossAmountProfit as NSNumber)
                return ("Valor do Rendimento", resulFormated!)
            case 3:
                let resulFormated = formatter.string(from: self.simulation.taxesRate as NSNumber)
                return ("IR sobre o investimento", resulFormated!)
            case 4:
                let resulFormated = formatter.string(from: self.simulation.netAmount as NSNumber)
                return ("Valor líquido do investimento", resulFormated!)
            default:
                break
            }
        } else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.locale = Locale(identifier: "en_US")
            switch index.row {
            case 0:
                return ("Data do resgate", String(self.simulation.investmentParameter.maturityDate))
            case 1:
                return ("Dias Corridos", String(self.simulation.investmentParameter.maturityTotalDays))
            case 2:
                let resulFormated = formatter.string(from: self.simulation.monthlyGrossRateProfit as NSNumber)
                return ("Rendimento mensal", resulFormated!)
            case 3:
                let resulFormated = String(format: "%.1f%%", self.simulation.investmentParameter.rate)
                return ("Percentual do CDI do investimento", resulFormated)
            case 4:
                let resulFormated = formatter.string(from: self.simulation.annualGrossRateProfit as NSNumber)
                return ("Rentabilidade Anual", resulFormated!)
            case 5:
                let resulFormated = formatter.string(from: self.simulation.rateProfit as NSNumber)
                return ("Rentabilidade no período", resulFormated!)
            default:
                break
            }
        }
        return ("", "")
    }
}
