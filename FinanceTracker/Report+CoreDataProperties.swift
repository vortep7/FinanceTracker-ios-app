//
//  Report+CoreDataProperties.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 08.03.2024.
//
//

import Foundation
import CoreData


@objc(Report)
public class Report: NSManagedObject {}

extension Report {

    @NSManaged public var amount: Int32
    @NSManaged public var reason: String
    @NSManaged public var id: Int16
    @NSManaged public var date: Date

}

extension Report : Identifiable {}
