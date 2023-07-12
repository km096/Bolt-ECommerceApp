//
//  FeaturedCell.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import UIKit

class ItemCell: UICollectionViewCell {

    //MARK: - IbOutlets
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tShirtTitle: UILabel!
    
    @IBOutlet weak var tShirtImageview: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - SetupCell
    func setupCell(item: ItemModel) {
        priceLabel.text = item.price
        tShirtTitle.text = item.title
        tShirtImageview.image = UIImage(named: item.imageName ?? "")

    }
    
    

}
