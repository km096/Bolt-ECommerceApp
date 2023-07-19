//
//  CategoryCell.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/5/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCellViews()
    }
    
    //MARK: - UpdateUI
    func updateCellViews() {
        colorView.layer.cornerRadius = 10
        colorView.layer.masksToBounds = true

        categoryImageView.layer.cornerRadius = 10
        categoryImageView.layer.masksToBounds = true
        
        categoryLabel.textColor = .white

    }
    
    //MARK: - SetupCell
    func updateCellFor(indexpath: Int) {
        switch indexpath{
        case 0 :
            setupCell(category: Constants.Categories.women)
            
        case 1 :
            setupCell(category: Constants.Categories.men)


        default:
            setupCell(category: Constants.Categories.kids)

        }
    }
    
    private func setupCell(category: Category) {
        categoryImageView.image = category.image
        colorView.backgroundColor = category.color
        categoryLabel.text = category.title
    }


}
