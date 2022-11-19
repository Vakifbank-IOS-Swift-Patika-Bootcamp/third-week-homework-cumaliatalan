//
//  TableViewCell.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 19.11.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(model: EmployeeModel) {
        nameLabel.text = model.name
        salaryLabel.text = String(model.salaryBase)
    }
}

