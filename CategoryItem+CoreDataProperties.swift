//
//  CategoryItem+CoreDataProperties.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/7/23.
//
//

import Foundation
import CoreData


extension CategoryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryItem> {
        return NSFetchRequest<CategoryItem>(entityName: "CategoryItem")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: String?
    @NSManaged public var imageName: String?
    @NSManaged public var id: Int32

}

extension CategoryItem : Identifiable {

}
