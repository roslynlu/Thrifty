//
//  IncomeMO+CoreDataProperties.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/14/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData


extension IncomeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IncomeMO> {
        return NSFetchRequest<IncomeMO>(entityName: "Income")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var daysCycle: Int16
    @NSManaged public var amount: Double
    @NSManaged public var type: String?
    @NSManaged public var receivedBy: UserMO?

}
