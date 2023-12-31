//
//  AddressTableViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//

import UIKit
import CoreData

extension AddressVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.identifier, for: indexPath) as? AddressCell {
            
            let customSelectionColorView = UIView()
            customSelectionColorView.backgroundColor = .clear
            cell.selectedBackgroundView = customSelectionColorView
            
            cell.setupCell(address: address[indexPath.row])
            
            if let index = userDefaults.object(forKey: Key.selectedRow.rawValue) {
                cell.status = index as! Int == indexPath.row
            }
            address[indexPath.row].checkmarked = cell.status ?? false
            AppDelegate.sharedAppDelegate.coreDataStackAddress.saveContext()

            if address[indexPath.row].checkmarked == true {
                cell.checkBoxImageView.image = UIImage(named: "checked")
            } else {
                cell.checkBoxImageView.image = UIImage(named: "unchecked")
            }
            
            AppDelegate.sharedAppDelegate.coreDataStackAddress.saveContext()

            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        userDefaults.set(selectedIndex, forKey: Key.selectedRow.rawValue)
        addressTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            managedContextAddress.delete(address[indexPath.row])
            AppDelegate.sharedAppDelegate.coreDataStackAddress.saveContext()
            
            self.address.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            addressTableView.reloadData()
        }
        
    }
    
    
}
