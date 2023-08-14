//
//  LanguageCell.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/9/23.
//

import UIKit

class LanguageCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func setCell(_ indexPath: Int) {
//        switch indexPath {
//        case 0:
//            languageLabel.text = Language.en.rawValue
//        case 1:
//            languageLabel.text = Language.ar.rawValue
//        default:
//            break
//        }
//    }
    
}
