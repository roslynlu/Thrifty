//
//  ExpenseMO+CoreDataProperties.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/14/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData


extension ExpenseMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseMO> {
        return NSFetchRequest<ExpenseMO>(entityName: "Expense")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var amount: Double
    @NSManaged public var daysCycle: Int16
    @NSManaged public var date: NSDate?
    @NSManaged public var spentBy: UserMO?

}
