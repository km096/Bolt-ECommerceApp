//
//  UserItem+CoreDataProperties.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//
//

import Foundation
import CoreData


extension UserItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserItem> {
        return NSFetchRequest<UserItem>(entityName: "UserItem")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var isLogin: Bool

}

extension UserItem : Identifiable {

}
