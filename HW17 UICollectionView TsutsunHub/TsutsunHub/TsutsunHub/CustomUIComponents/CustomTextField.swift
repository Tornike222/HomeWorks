//
//  InputField.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(){
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: "FiraGO-Regular", size: 15)
        backgroundColor = .clear
        borderStyle = .roundedRect
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.5529411435, green: 0.5529412031, blue: 0.5529411435, alpha: 1)
    }
    
    
}
