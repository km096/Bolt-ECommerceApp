//
//  AddressCell1.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 10/8/23.
//

import UIKit

class AddressCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var postalCodeLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var checkBoxImageView: UIImageView!
    
    var status: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postalCodeLbl.text = "postalCode".localized
        cityLbl.text = "city".localized
    }

    
    func setupCell(address: Address) {
        addressLabel.text = address.address
        postalCodeLabel.text = address.postalCode
        cityLabel.text = address.city
    }
    
}
