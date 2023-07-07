//
//  FeaturedCell.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {

    //MARK: - IbOutlets
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tShirtTitle: UILabel!
    
    @IBOutlet weak var tShirtImageview: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - SetupCell
    func setupCell(homeCategory: HomeCategory) {
        priceLabel.text = homeCategory.price
        tShirtTitle.text = homeCategory.title
        tShirtImageview.image = UIImage(named: homeCategory.imageName ?? "")

    }
    
    

}
