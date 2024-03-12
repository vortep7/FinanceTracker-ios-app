//
//  Purchase+CoreDataProperties.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 12.03.2024.
//
//

import Foundation
import CoreData

@objc(Purchase)
public class Purchase: NSManagedObject {

}

extension Purchase {

    @NSManaged public var id: Int16
    @NSManaged public var reason: String?
    @NSManaged public var amount: String?
    @NSManaged public var data: Date?
    @NSManaged public var uid: String?

}

extension Purchase : Identifiable {

}
