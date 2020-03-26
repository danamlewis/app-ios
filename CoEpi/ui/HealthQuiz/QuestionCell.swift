import UIKit

class QuestionCell: UITableViewCell {
    public var onChecked: ((Question, Bool) -> ())?

    private let checkBox: CheckBox = .init()
    private var question: Question?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        checkBox.onChecked = { [weak self] (checked: Bool) -> Void in
            guard let this = self, let q = this.question else { return }
            this.onChecked?(q, checked)
        }
        accessoryView = checkBox
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setQuestion(question: Question) {
        self.question = question
        textLabel?.text = question.text
        checkBox.isChecked = question.checked
    }
}

class CheckBox: UIButton {
    public var onChecked: ((Bool) -> ())?

    // TOOD: do this properly
    let rect = CGRect(x: 0, y: 0, width: 20, height: 20)
    let checkedImage = UIImage(named: "checkbox_checked")
    let uncheckedImage = UIImage(named: "checkbox_unchecked")

    init() {
        super.init(frame: rect)

        addTarget(self, action:#selector(buttonClicked(sender:)), for: .touchUpInside)
        isChecked = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var isChecked: Bool = false {
        didSet {
            if isChecked {
                setImage(checkedImage, for: .normal)
            } else {
                setImage(uncheckedImage, for: .normal)
            }
        }
    }

    @objc func buttonClicked(sender: UIButton) {
        isChecked = !isChecked
        onChecked?(isChecked)
    }
}
