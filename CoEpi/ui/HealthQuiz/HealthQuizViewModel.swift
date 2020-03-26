class HealthQuizViewModel {
    weak var delegate: HealthQuizViewModelDelegate?

    private var questions: Array<Question> = [
        Question(id: 1, text: "Fever", checked: false),
        Question(id: 2, text: "Tiredness", checked: false),
        Question(id: 3, text: "Dry cough", checked: false),
        Question(id: 4, text: "Muscle aches", checked: false),
        Question(id: 5, text: "Nasal aongestion", checked: false),
        Question(id: 6, text: "Runny nose", checked: false),
        Question(id: 7, text: "Sore throat", checked: false),
        Question(id: 8, text: "Diarrhea", checked: false),
        Question(id: 9, text: "Difficulty breathing", checked: false),
        Question(id: 10, text: "Loss of smell/taste", checked: false),
        Question(id: 11, text: "None of the Above", checked: false)
    ]
    
    var numQuestions: Int { questions.count }

    func question(at index: Int) -> Question {
        return questions[index]
    }

    func handleAnswer(question: Question, checked: Bool) {
        // TODO: represent as a map
        let index: Int? = questions.firstIndex { $0.id == question.id }
        guard let i = index else { return }

        let q = questions[i]
        questions[i] = Question(id: q.id, text: q.text, checked: checked)
    }

    func onTapSubmit() {
        delegate?.onSubmit()
    }
}

struct Question {
    let id: Int
    let text: String
    let checked: Bool
}

protocol HealthQuizViewModelDelegate: class {
    func onSubmit()
}
