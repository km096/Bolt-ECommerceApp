//
//  SideMenuTableViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/14/23.
//

import UIKit

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else {
            fatalError("xib doesn't exist")
        }
        
        let menu = menus[indexPath.row]
        
        let customSelectionColorView = UIView()
        customSelectionColorView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.selectedBackgroundView = customSelectionColorView
        cell.titleLabel.text = menu.title
        cell.iconImageView.image = menu.icon
        
        return cell
        
    }
    
}
