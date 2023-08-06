//
//  UIImageViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/6/23.
//

import UIKit

extension UIImageView {
    
    func makeRounded() {
        
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
