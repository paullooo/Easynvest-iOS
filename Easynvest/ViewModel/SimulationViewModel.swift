//
//  SimulationViewModel.swift
//  Easynvest
//
//  Created by Developer on 05/08/18.
//
import Foundation

enum SimulationParams: String {
    case investedAmount
    case index
    case rate
    case isTaxFree
    case maturityDate
}

class SimulationViewModel {
    var investedAmount: String = ""
    var rate: String = ""
    var maturityDate: String = ""
    var questions: [QuestionForm] = []
    var isReadySubmit: Bool {
        return investedAmount != "" && rate != "" && maturityDate != ""
    }
    var dic: [String: String] {
        return [SimulationParams.investedAmount.rawValue: self.investedAmount,
                SimulationParams.rate.rawValue: self.rate,
                SimulationParams.maturityDate.rawValue: self.maturityDate,
                SimulationParams.index.rawValue: "CDI",
                SimulationParams.isTaxFree.rawValue: "false"]
    }
    func setWith(identifier: String, value: String) {
        switch SimulationParams(rawValue: identifier)! {
        case .investedAmount:
            self.investedAmount = value
        case .rate:
            self.rate = value
        case .maturityDate:
            self.maturityDate = value
        default:
            break
        }
    }
}
