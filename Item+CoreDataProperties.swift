//
//  Item+CoreDataProperties.swift
//  Devote
//
//  Created by Sadık Çoban on 9.09.2021.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var task: String?

}

extension Item : Identifiable {

}
