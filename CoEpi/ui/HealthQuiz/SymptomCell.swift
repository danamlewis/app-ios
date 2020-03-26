//
//  SymptomCell.swift
//  CoEpi
//
//  Created by Johnson Hsieh on 3/26/20.
//  Copyright © 2020 org.coepi. All rights reserved.
//

import UIKit

class SymptomCell: UITableViewCell {

    let checkBox: CheckBox = .init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        textLabel?.text = "testing 55"
//        accessoryType = .checkmark
        checkBox.isChecked = false
        accessoryView = checkBox
        
//        imageView?.image = UIImage(named: "checkbox_checked")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CheckBox: UIButton {
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
    
    // Bool property
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
        }
    }
}
