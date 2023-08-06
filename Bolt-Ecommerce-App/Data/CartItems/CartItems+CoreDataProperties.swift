//
//  CartItems+CoreDataProperties.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/31/23.
//
//

import Foundation
import CoreData


extension CartItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartItems> {
        return NSFetchRequest<CartItems>(entityName: "CartItems")
    }

    @NSManaged public var color: String?
    @NSManaged public var id: String?
    @NSManaged public var imageName: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int32
    @NSManaged public var size: String?
    @NSManaged public var title: String?
    @NSManaged public var isFavorite: Bool

}

extension CartItems : Identifiable {

}
