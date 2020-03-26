//
//  HealthQuizViewController.swift
//  CoEpi
//
//  Created by Dusko Ojdanic on 3/26/20.
//  Copyright © 2020 org.coepi. All rights reserved.
//

import UIKit

class HealthQuizViewController: UIViewController {
    private let viewModel: HealthQuizViewModel

    @IBOutlet weak var questionList: UITableView!
    
    init(viewModel: HealthQuizViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func submit(_ sender: UIButton) {
        viewModel.onTapSubmit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        questionList.register(QuestionCell.self, forCellReuseIdentifier: "QuestionCell")
        questionList.delegate = self
        questionList.dataSource = self
    }
}

extension HealthQuizViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numQuestions
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell")!
        guard let questionCell = cell as? QuestionCell else { return cell }
        
        let question: Question = viewModel.question(at: indexPath.row)
        questionCell.setQuestion(question: question)
        
        questionCell.onChecked = { (question, checked) in
            self.viewModel.handleAnswer(question: question, checked: checked)
        }

        return questionCell
    }
}
