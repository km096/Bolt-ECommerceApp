//
//  UIView.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit

extension UIView {
    
    func addCornerRadius (cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.tintColor = .white
    }
    
    func addGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [#colorLiteral(red: 0.3918638825, green: 0.4896153212, blue: 0.9518013597, alpha: 1).cgColor, #colorLiteral(red: 0.3728943467, green: 0.5526257753, blue: 0.9744415879, alpha: 1).cgColor, #colorLiteral(red: 0.337913394, green: 0.6154249907, blue: 0.9927951694, alpha: 1).cgColor, #colorLiteral(red: 0.2849549055, green: 0.7145707011, blue: 1, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 0.3, 0.8, 1]
        gradientLayer.frame = bounds

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addShadow(shadowOpacity: Float, shadowColor: CGColor) {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
}
