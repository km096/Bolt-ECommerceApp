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
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productquantityLabel: UILabel!
    @IBOutlet weak var productSize: UILabel!
    @IBOutlet weak var productColor: UILabel!
    
    //Views
    @IBOutlet weak var containerView: UIView!
    
    //Buttons
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    
    //Vars
    var cancelAction: (() -> Void)?
    var incrementAction: (() -> Void)?
    var decrementAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.addShadow(shadowOpacity: 0.5, shadowColor: UIColor.gray.cgColor)
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
        decrementButton.addTarget(self, action: #selector(decrementButtonPressed), for: .touchUpInside)
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
    
    func setupCell(_ cartItem: CartItems) {
        productTitle.text = cartItem.title
        productPrice.text = "$\(cartItem.price)"
        productquantityLabel.text = "\(cartItem.quantity)"
        productSize.text = cartItem.size
        productColor.text = cartItem.color
        productImageView.image = UIImage(named: cartItem.imageName ?? "")
    }
    
    @objc func cancelButtonPressed() {
        cancelAction?()
    }
    
    @objc func incrementButtonPressed() {
        incrementAction?()
    }
    
    @objc func decrementButtonPressed() {
        decrementAction?()
    }
    
    
}
