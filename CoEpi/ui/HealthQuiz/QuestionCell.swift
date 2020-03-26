//
//  QuestionCell.swift
//  CoEpi
//
//  Created by Johnson Hsieh on 3/26/20.
//  Copyright © 2020 org.coepi. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {
    public var onChecked: ((Question, Bool) -> ())?

    private let checkBox: CheckBox = .init()
    private var question: Question?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        checkBox.onChecked = { (checked: Bool) -> Void in
            guard let q = self.question else { return }
            self.onChecked?(q, checked)
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

    let rect = CGRect(x: 0, y: 0, width: 20, height: 20)
    // Images
    let checkedImage = UIImage(named: "checkbox_checked")
    let uncheckedImage = UIImage(named: "checkbox_unchecked")

    init() {
        super.init(frame: rect)

        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
            onChecked?(isChecked)
        }
    }
}
