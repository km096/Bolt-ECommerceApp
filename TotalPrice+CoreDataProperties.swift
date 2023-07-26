//
//  TotalPrice+CoreDataProperties.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/26/23.
//
//

import Foundation
import CoreData


extension TotalPrice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TotalPrice> {
        return NSFetchRequest<TotalPrice>(entityName: "TotalPrice")
    }

    @NSManaged public var totalPrice: Double

}

extension TotalPrice : Identifiable {

}
