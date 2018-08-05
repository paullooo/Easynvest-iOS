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
}

class Form {
    static func getSimulationQuestions() -> [QuestionForm] {
        var questions: [QuestionForm] = []
        let questionOne = QuestionForm(question: "Quanto você gostaria de aplicar? *", placeholder: "R$")
        let questionTwo = QuestionForm(
            question: "Qual a data de vencimento do seu investimento? *",
            placeholder: "dia/mês/ano")
        let questionTree = QuestionForm(question: "Qual o percentual de CDI do investimento? *", placeholder: "100%")
        questions.append(questionOne)
        questions.append(questionTwo)
        questions.append(questionTree)
        return questions
    }
}
