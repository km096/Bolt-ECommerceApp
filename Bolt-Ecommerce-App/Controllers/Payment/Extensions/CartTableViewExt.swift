//
//  CartTableViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/13/23.
//

import UIKit

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as? CartCell {
            cell.setupCell(cartItems[indexPath.row])
            cell.cancelAction = { 
                self.removeItem(atIndexPath: indexPath)
            }
            cell.incrementAction = {
                self.incrementItemQyantity(atIndexPath: indexPath)
            }
            cell.decrementAction = {
                self.decrementItemQyantity(atIndexPath: indexPath)
            }
            return cell

        }
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
}
