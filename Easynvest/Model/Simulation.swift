//
//  Simulation.swift
//  Easynvest
//
//  Created by Developer on 04/08/18.
//
import Foundation

struct Simulation: Codable {
    let investmentParameter: Investment
    let grossAmount: Float
    let taxesAmount: Float
    let netAmount: Float
    let grossAmountProfit: Float
    let netAmountProfit: Float
    let annualGrossRateProfit: Float
    let monthlyGrossRateProfit: Float
    let dailyGrossRateProfit: Double
    let taxesRate: Float
    let rateProfit: Double
    let annualNetRateProfit: Float
}
