//
//  AddAddressCell.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/18/23.
//

import UIKit

class AddressCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var houseNumberLabel: UILabel!
    @IBOutlet weak var roadNumberLabel: UILabel!
    
    @IBOutlet weak var checkBox: CheckBox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCheckBox()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func updateCheckBox() {
        checkBox.style = .circle
        checkBox.borderStyle = .rounded
    }
    
}