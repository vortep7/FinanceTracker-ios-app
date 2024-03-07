//
//  User+CoreDataProperties.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 07.03.2024.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject{}


extension User {

    @NSManaged public var id: Int16
    @NSManaged public var title: String?

}

extension User : Identifiable {}
