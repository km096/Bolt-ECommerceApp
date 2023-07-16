//
//  FeaturedCell.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import UIKit

class ProductCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImageview: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - SetupCell
    func setupCell(product: ProductModel) {
        priceLabel.text = product.price
        productTitle.text = product.title
        productImageview.image = UIImage(named: product.imageName ?? "")

    }
    
    

}
