//
//  Investment.swift
//  Easynvest
//
//  Created by Developer on 04/08/18.
//

import Foundation

struct Investment: Codable {
    let investedAmount: Float
    let yearlyInterestRate: Float
    let maturityTotalDays: Int
    let maturityBusinessDays: Int
    let maturityDate: String
    let rate: Float
    let isTaxFree: Bool
}
