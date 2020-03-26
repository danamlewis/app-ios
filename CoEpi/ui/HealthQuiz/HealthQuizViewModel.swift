//
//  HealthQuizViewModel.swift
//  CoEpi
//
//  Created by Johnson Hsieh on 3/26/20.
//  Copyright © 2020 org.coepi. All rights reserved.
//

class HealthQuizViewModel {
    private var questions: Array<Question> = [
        Question(id: 1, text: "Question1", checked: false),
        Question(id: 2, text: "Question2", checked: false),
        Question(id: 3, text: "Question3", checked: false),
        Question(id: 4, text: "Question4", checked: false),
        Question(id: 5, text: "Question5", checked: false),
        Question(id: 6, text: "Question6", checked: false),
        Question(id: 7, text: "Question7", checked: false),
        Question(id: 8, text: "Question8", checked: false),
        Question(id: 9, text: "Question9", checked: false),
        Question(id: 10, text: "Question10", checked: false),
        Question(id: 11, text: "Question11", checked: false),
        Question(id: 12, text: "Question12", checked: false),
        Question(id: 13, text: "Question13", checked: false),
        Question(id: 14, text: "Question14", checked: false),
        Question(id: 15, text: "Question15", checked: false),
        Question(id: 16, text: "Question16", checked: false),
        Question(id: 17, text: "Question17", checked: false),
        Question(id: 18, text: "Question18", checked: false),
        Question(id: 19, text: "Question19", checked: false),
        Question(id: 20, text: "Question20", checked: false)
    ]
    
    var numQuestions: Int { return questions.count }

    func question(at index: Int) -> Question {
        return questions[index]
    }

    func handleAnswer(question: Question, checked: Bool) {
        // inefficient, i know, can replace with a map
        let index: Int? = questions.firstIndex { $0.id == question.id }
        guard let i = index else { return }

        let q = questions[i]
        questions[i] = Question(id: q.id, text: q.text, checked: checked)
    }
}

struct Question {
    let id: Int
    let text: String
    var checked: Bool
}
