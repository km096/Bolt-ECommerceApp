//
//  Product.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/16/23.
//

import Foundation


struct Product: Codable {
    var id: String
    var title: String
    var price: Double
    var imageName: String

}

func saveProductLocally(_ product: Product) {
    
    let encode = JSONEncoder()
    do {
        let data = try encode.encode(product)
        userDefaults.set(data, forKey: Key.cartProductsKey.rawValue)
    } catch {
        print("Error saving cart items locally: \(error.localizedDescription)")
    }
}
