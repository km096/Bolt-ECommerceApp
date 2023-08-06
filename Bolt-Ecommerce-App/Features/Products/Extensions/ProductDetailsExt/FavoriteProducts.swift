//
//  FavoriteProducts.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/3/23.
//

import UIKit

extension ProductDetailsVC {
    
    func checkFavorite() {
        let fetchRequest = CartItems.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)

        do {
            let result = try managedContextCartItems.fetch(fetchRequest)
            print("product id: \(product.id)")
            print("fetched product count: \(result.count)")
            if let favoriteProduct = result.first {
                if favoriteProduct.isFavorite {
                    self.isFavorite = true
                } else {
                    self.isFavorite = false
                }
                print(favoriteProduct.isFavorite)
            }
            updatUIForFavoriteButton()
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
       
    }
    
    func saveProductToFavorite() {
        let fetchRequest = CartItems.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
        
        do {
            let favoriteProduct = try managedContextCartItems.fetch(fetchRequest)
            if let product = favoriteProduct.first {
                product.isFavorite = true
            }
            isFavorite = true
            AppDelegate.sharedAppDelegate.coreDataStackCartItems.saveContext()
            print("product \(product.id) removed from favorite")
            updatUIForFavoriteButton()
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
    
    func removeProductFromFavorite() {
        let fetchRequest = CartItems.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", product.id)
        
        do {
            let favoriteProduct = try managedContextCartItems.fetch(fetchRequest)
            if let product = favoriteProduct.first {
                product.isFavorite = false
            }
            isFavorite = false
            AppDelegate.sharedAppDelegate.coreDataStackCartItems.saveContext()
            print(favoriteProduct.first!.isFavorite)
            print("product \(product.id) removed from favorite")
            updatUIForFavoriteButton()
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
        
    }
}
