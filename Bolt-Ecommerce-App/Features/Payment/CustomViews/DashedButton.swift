//
//  DashedButton.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//

import UIKit

class DashedButton: UIButton {
    
    var dashedLineBorder: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        dashedLineBorder = CAShapeLayer()
        dashedLineBorder.strokeColor = #colorLiteral(red: 0.4242071807, green: 0.528095901, blue: 0.8550408483, alpha: 1).cgColor
        dashedLineBorder.lineDashPattern = [2, 3]
        dashedLineBorder.frame = self.bounds
        dashedLineBorder.fillColor = nil
        dashedLineBorder.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.addSublayer(dashedLineBorder)
        
    }
}

