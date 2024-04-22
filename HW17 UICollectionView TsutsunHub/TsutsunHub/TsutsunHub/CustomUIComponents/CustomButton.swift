//
//  CustomButton.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//


import UIKit

class CustomButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        touch()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
        touch()
    }
    
    func setupButton(){
        backgroundColor = UIColor.purple
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func touch(){
        addAction(UIAction(handler: { _ in
            self.buttonTouchedDown()
        }), for: .touchDown)
        
        addAction(UIAction(handler: { _ in
            self.buttonTouchedUp()
        }), for: .touchUpInside)
    }
    
    func buttonTouchedDown(){
        layer.opacity = 0.5
    }
    
    @objc func buttonTouchedUp(){
        layer.opacity = 1
    }
    
}
