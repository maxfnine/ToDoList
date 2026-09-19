//
//  PillButton.swift
//  ToDoList
//
//  Created by My mac on 18/09/2026.
//

import UIKit

class PillButton: UIButton {

    override  func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = UIColor.link
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
    }

}
