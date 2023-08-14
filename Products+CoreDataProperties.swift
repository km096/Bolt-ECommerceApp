//
//  Products+CoreDataProperties.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/8/23.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var addToCart: Bool
    @NSManaged public var addToFavorite: Bool
    @NSManaged public var color: String?
    @NSManaged public var id: String?
    @NSManaged public var imageName: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int32
    @NSManaged public var size: String?
    @NSManaged public var title: String?

}

extension Products : Identifiable {

}
