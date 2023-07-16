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
            setupCell(title: Constants.Category.Title.women, color: Constants.Category.Colors.women)
            
        case 1 :
            setupCell(title: Constants.Category.Title.men, color: Constants.Category.Colors.men)

        default:
            setupCell(title: Constants.Category.Title.kids, color: Constants.Category.Colors.kids)
        }
    }
    
    private func setupCell(title: String, color: UIColor) {
        categoryImageView.image = UIImage(named: title)
        colorView.backgroundColor = color
        categoryLabel.text = title
    }


}
