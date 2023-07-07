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
        // Initialization code
        updateCellViews()
    }
    
    //MARK: - UpdateUI
    func updateCellViews() {
        colorView.layer.cornerRadius = 10
        colorView.layer.masksToBounds = true
//        colorView.setShadow(shadowOpacity: 1, shadowColor: UIColor.lightGray.cgColor)
        
        categoryImageView.layer.cornerRadius = 10
        categoryImageView.layer.masksToBounds = true
        
        categoryLabel.textColor = .white

    }
    
    //MARK: - SetupCell
    func setupCategoryCell(type: Int) {
        switch type{
        case 0 :
            setCell(CategoryTitle: Constants.Category.Title.women, CategoryColor: Constants.Category.Colors.women)
            
        case 1 :
            setCell(CategoryTitle: Constants.Category.Title.men, CategoryColor: Constants.Category.Colors.men)

        default:
            setCell(CategoryTitle: Constants.Category.Title.kids, CategoryColor: Constants.Category.Colors.kids)
        }
    }
    
    //MARK: - Helpers
    private func setCell(CategoryTitle: String, CategoryColor: UIColor) {
        categoryImageView.image = UIImage(named: CategoryTitle)
        colorView.backgroundColor = CategoryColor
        categoryLabel.text = CategoryTitle
    }


}
