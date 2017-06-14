//
//  GoalMO+CoreDataProperties.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/14/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData


extension GoalMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalMO> {
        return NSFetchRequest<GoalMO>(entityName: "Goal")
    }

    @NSManaged public var name: String?
    @NSManaged public var descr: String?
    @NSManaged public var amount: Double
    @NSManaged public var amountSoFar: Double
    @NSManaged public var completed: Bool
    @NSManaged public var date: NSDate?
    @NSManaged public var setBy: UserMO?

}
