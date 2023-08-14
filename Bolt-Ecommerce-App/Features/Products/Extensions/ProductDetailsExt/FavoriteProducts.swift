//
//  FavoriteProducts.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/3/23.
//

import UIKit
import CoreData
import ProgressHUD

extension ProductDetailsVC {
    
    func checkFavorite() {
        let bool = NSNumber(booleanLiteral: true)
        let fetchRequest = Products.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "addToFavorite == %@", bool as CVarArg)
        fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)

        do {
            let result = try managedContextProducts.fetch(fetchRequest)
            let favoriteProduct = result.last
            if favoriteProduct != nil {
                if favoriteProduct!.addToFavorite {
                    self.isFavorite = true
                } else {
                    self.isFavorite = false
                }
            }
            updatUIForFavoriteButton()
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
       
    }
    
    func addToFavorite() {
        let bool = NSNumber(booleanLiteral: true)
        let fetchRequest = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "addToFavorite == %@ AND id == %@", bool as CVarArg, product.id)
        
        do {
            let favoriteProducts = try managedContextProducts.fetch(fetchRequest)
            if favoriteProducts.count > 0 {
                favoriteProducts.first?.addToFavorite = false
                managedContextProducts.delete(favoriteProducts.first!)
                isFavorite = favoriteProducts.first?.addToFavorite
                ProgressHUD.showSucceed("Product removed from Favorite")
            } else {
                let favoriteProduct = Products(context: managedContextProducts)
                favoriteProduct.id = product.id
                favoriteProduct.addToFavorite = true
                isFavorite = favoriteProduct.addToFavorite
                favoriteProduct.imageName = product.imageName
                favoriteProduct.price = product.price
                favoriteProduct.title = product.title
                ProgressHUD.showSucceed("Product added to Favorite")
            }
            updatUIForFavoriteButton()
            AppDelegate.sharedAppDelegate.coreDataStackProducts.saveContext()
            
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
    

}
