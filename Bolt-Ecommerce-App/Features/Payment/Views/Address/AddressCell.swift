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
    @IBOutlet weak var postalCodeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var checkBox: CheckBox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCheckBox()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.checkBox.isChecked = selected
       
    }
    
    func updateCheckBox() {
        checkBox.style = .circle
        checkBox.borderStyle = .rounded
    }
    
    func setupCell(address: Address) {
        addressLabel.text = address.address
        postalCodeLabel.text = address.postalCode
        cityLabel.text = address.city
    }
    
}
