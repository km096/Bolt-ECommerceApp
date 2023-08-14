//
//  CartProducts.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/9/23.
//

import UIKit
import CoreData
import ProgressHUD

extension ProductDetailsVC {
    
    func addProductToCart() {
        let bool = NSNumber(booleanLiteral: true)
        let fetchRequest = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@ AND #size == %@ AND color == %@ And addToCart == %@", product.id, size, color, bool as CVarArg)
        
        do {
            let cartProducts = try managedContextProducts.fetch(fetchRequest)
            
            if let product = cartProducts.first {
                    product.quantity += 1
            } else {
                let cartProduct = Products(context: managedContextProducts)
                cartProduct.addToCart = true
                cartProduct.quantity = 1
                cartProduct.id = product.id
                cartProduct.title = product.title
                cartProduct.price = product.price
                cartProduct.imageName = product.imageName
                cartProduct.color = color
                cartProduct.size = size
            }
            
            AppDelegate.sharedAppDelegate.coreDataStackProducts.saveContext()
            ProgressHUD.showSucceed("Item added to the cart")

        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
}
