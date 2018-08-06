//
//  FormSimulation.swift
//  Easynvest
//
//  Created by Developer on 05/08/18.
//

import Foundation

struct QuestionForm {
    var question: String
    var placeholder: String
    var identifier: String
}

class Form {
    static func getSimulationQuestions() -> [QuestionForm] {
        var questions: [QuestionForm] = []
        let questionOne = QuestionForm(question: "Quanto você gostaria de aplicar? *",
                                       placeholder: "R$", identifier: "investedAmount")
        let questionTwo = QuestionForm(question: "Qual a data de vencimento do seu investimento? *",
                                       placeholder: "dia/mês/ano", identifier: "maturityDate")
        let questionThree = QuestionForm(question: "Qual o percentual de CDI do investimento? *",
                                         placeholder: "100%", identifier: "rate")
        questions.append(questionOne)
        questions.append(questionTwo)
        questions.append(questionThree)
        return questions
    }
}
