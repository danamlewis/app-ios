import Foundation

protocol SymptomRepo {
    func symptoms() -> [Symptom]

    func submitSymptoms(symptoms: [Symptom])
}

class SymptomRepoImpl: SymptomRepo {

    func symptoms() -> [Symptom] {
        [
            Symptom(name: "Fever"),
            Symptom(name: "Tiredness"),
            Symptom(name: "Loss of appetite"),
            Symptom(name: "Muscle aches"),
            Symptom(name: "Trouble breathing"),
            Symptom(name: "Nasal congestion"),
            Symptom(name: "Sneezing"),
            Symptom(name: "Sore throat"),
            Symptom(name: "Headaches"),
            Symptom(name: "Diarrhea"),
            Symptom(name: "Loss of smell or taste")
        ]
    }

    func submitSymptoms(symptoms: [Symptom]) {
        // Send to api
    }
}
