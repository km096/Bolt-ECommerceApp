//
//  VisaCell.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/29/23.
//

import UIKit

class VisaCell: UICollectionViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
