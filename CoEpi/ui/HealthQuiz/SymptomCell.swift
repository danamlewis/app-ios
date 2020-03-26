//
//  SymptomCell.swift
//  CoEpi
//
//  Created by Johnson Hsieh on 3/26/20.
//  Copyright © 2020 org.coepi. All rights reserved.
//

import UIKit

class SymptomCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabel?.text = "test 2"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
