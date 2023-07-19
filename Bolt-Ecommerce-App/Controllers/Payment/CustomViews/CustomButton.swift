//
//  CustomButton.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/12/23.
//

import UIKit

class CustomButton: UIButton {

    enum ButtonState {
        case selected
        case normal
    }
    
    private var selectedBackgroundColor: UIColor?

    private var defaultBackgroundColor: UIColor? {
        
        didSet {
            self.backgroundColor = defaultBackgroundColor
        }
    }
    
    private var selectedTintColor: UIColor?

    private var defaultTintColor: UIColor? {
        
        didSet {
            self.backgroundColor = defaultTintColor
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                if let color = selectedBackgroundColor,
                   let tintColor = selectedTintColor {
                    self.backgroundColor = color
                    self.tintColor = tintColor
                }
            } else {
                if let color = defaultBackgroundColor,
                   let tintColor = defaultTintColor {
                    self.backgroundColor = color
                    self.tintColor = tintColor
                }
            }
        }
    }
    
    func setButtonColor(_ backgroundcolor: UIColor, _ tintColor: UIColor, forState: ButtonState) {
        switch forState {
        case .selected:
            selectedBackgroundColor = backgroundcolor
            selectedTintColor = tintColor
        case .normal:
            defaultBackgroundColor = backgroundcolor
            defaultTintColor = tintColor
        }
    }

}
