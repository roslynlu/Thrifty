//
//  UserMO+CoreDataProperties.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/15/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData


extension UserMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserMO> {
        return NSFetchRequest<UserMO>(entityName: "User")
    }

    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var savingCoeff: Double
    @NSManaged public var receives: NSSet?
    @NSManaged public var spends: NSSet?
    @NSManaged public var wants: NSSet?
    @NSManaged public var plansToReceive: NSSet?
    @NSManaged public var plansToSpend: NSSet?

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

// MARK: Generated accessors for wants
extension UserMO {

    @objc(addWantsObject:)
    @NSManaged public func addToWants(_ value: FundMO)

    @objc(removeWantsObject:)
    @NSManaged public func removeFromWants(_ value: FundMO)

    @objc(addWants:)
    @NSManaged public func addToWants(_ values: NSSet)

    @objc(removeWants:)
    @NSManaged public func removeFromWants(_ values: NSSet)

}

// MARK: Generated accessors for plansToReceive
extension UserMO {

    @objc(addPlansToReceiveObject:)
    @NSManaged public func addToPlansToReceive(_ value: RecIncomeMO)

    @objc(removePlansToReceiveObject:)
    @NSManaged public func removeFromPlansToReceive(_ value: RecIncomeMO)

    @objc(addPlansToReceive:)
    @NSManaged public func addToPlansToReceive(_ values: NSSet)

    @objc(removePlansToReceive:)
    @NSManaged public func removeFromPlansToReceive(_ values: NSSet)

}

// MARK: Generated accessors for plansToSpend
extension UserMO {

    @objc(addPlansToSpendObject:)
    @NSManaged public func addToPlansToSpend(_ value: RecExpenseMO)

    @objc(removePlansToSpendObject:)
    @NSManaged public func removeFromPlansToSpend(_ value: RecExpenseMO)

    @objc(addPlansToSpend:)
    @NSManaged public func addToPlansToSpend(_ values: NSSet)

    @objc(removePlansToSpend:)
    @NSManaged public func removeFromPlansToSpend(_ values: NSSet)

}
