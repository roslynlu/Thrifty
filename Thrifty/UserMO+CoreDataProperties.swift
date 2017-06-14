//
//  UserMO+CoreDataProperties.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/14/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData


extension UserMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserMO> {
        return NSFetchRequest<UserMO>(entityName: "User")
    }

    @NSManaged public var cashOnHand: Double
    @NSManaged public var name: String?
    @NSManaged public var receives: NSSet?
    @NSManaged public var sets: NSSet?
    @NSManaged public var spends: NSSet?

}

// MARK: Generated accessors for receives
extension UserMO {

    @objc(addReceivesObject:)
    @NSManaged public func addToReceives(_ value: IncomeMO)

    @objc(removeReceivesObject:)
    @NSManaged public func removeFromReceives(_ value: IncomeMO)

    @objc(addReceives:)
    @NSManaged public func addToReceives(_ values: NSSet)

    @objc(removeReceives:)
    @NSManaged public func removeFromReceives(_ values: NSSet)

}

// MARK: Generated accessors for sets
extension UserMO {

    @objc(addSetsObject:)
    @NSManaged public func addToSets(_ value: GoalMO)

    @objc(removeSetsObject:)
    @NSManaged public func removeFromSets(_ value: GoalMO)

    @objc(addSets:)
    @NSManaged public func addToSets(_ values: NSSet)

    @objc(removeSets:)
    @NSManaged public func removeFromSets(_ values: NSSet)

}

// MARK: Generated accessors for spends
extension UserMO {

    @objc(addSpendsObject:)
    @NSManaged public func addToSpends(_ value: ExpenseMO)

    @objc(removeSpendsObject:)
    @NSManaged public func removeFromSpends(_ value: ExpenseMO)

    @objc(addSpends:)
    @NSManaged public func addToSpends(_ values: NSSet)

    @objc(removeSpends:)
    @NSManaged public func removeFromSpends(_ values: NSSet)

}
