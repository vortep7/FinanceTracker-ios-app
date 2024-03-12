//
//  Report+CoreDataProperties.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 12.03.2024.
//
//

import Foundation
import CoreData

@objc(Report)

extension Report {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Report> {
        return NSFetchRequest<Report>(entityName: "Report")
    }

    @NSManaged public var amount: String?
    @NSManaged public var id: Int16
    @NSManaged public var reason: String?

}

extension Report : Identifiable {

}
