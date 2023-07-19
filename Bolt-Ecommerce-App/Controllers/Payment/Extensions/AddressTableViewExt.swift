//
//  AddressTableViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//

import UIKit

extension AddressVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.identifier, for: indexPath) as? AddressCell {
            let customSelectionColorView = UIView()
            customSelectionColorView.backgroundColor = .clear
            cell.selectedBackgroundView = customSelectionColorView
            cell.checkBox.isChecked = indexPath.row == selectedIndex
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        addressTableView.reloadData()
    }
    
    
}
