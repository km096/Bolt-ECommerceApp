//
//  CartCell.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/13/23.
//

import UIKit

class CartCell: UITableViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    //MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    
    //Labels
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productType: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
//    @IBOutlet weak var containerView: UIView!
    
    //Vars
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.black.cgColor
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
