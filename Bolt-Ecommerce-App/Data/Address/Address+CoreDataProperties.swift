//
//  Address+CoreDataProperties.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var postalCode: String?
    @NSManaged public var city: String?
    @NSManaged public var phoneNumber: String?

}

extension Address : Identifiable {

}
