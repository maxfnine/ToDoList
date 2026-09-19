//
//  RoundedButton.swift
//  ToDoList
//
//  Created by My mac on 18/09/2026.
//

import UIKit

class RoundedButton: UIButton {

    override  func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.style(.buttonTitle)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }
}
