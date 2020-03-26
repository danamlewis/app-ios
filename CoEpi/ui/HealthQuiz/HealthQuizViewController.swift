import UIKit

class HealthQuizViewController: UIViewController {
    private let viewModel: HealthQuizViewModel

    @IBOutlet weak var questionList: UITableView!
    
    init(viewModel: HealthQuizViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
        title = "My Health"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func submit(_ sender: UIButton) {
        viewModel.onTapSubmit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        questionList.register(cellClass: QuestionCell.self)
        questionList.delegate = self
        questionList.dataSource = self
    }
}

extension HealthQuizViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numQuestions
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeue(cellClass: QuestionCell.self, forIndexPath: indexPath)
        guard let questionCell = cell as? QuestionCell else { return cell }
        
        let question: Question = viewModel.question(at: indexPath.row)
        questionCell.setQuestion(question: question)
        
        questionCell.onChecked = { [weak viewModel] (question, checked) in
            viewModel?.handleAnswer(question: question, checked: checked)
        }

        return questionCell
    }
}
