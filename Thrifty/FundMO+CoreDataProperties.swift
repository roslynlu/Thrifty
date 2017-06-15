//
//  FundMO+CoreDataProperties.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/15/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData


extension FundMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FundMO> {
        return NSFetchRequest<FundMO>(entityName: "Fund")
    }

    @NSManaged public var amount: Double
    @NSManaged public var amountSoFar: Double
    @NSManaged public var completed: Bool
    @NSManaged public var date: NSDate?
    @NSManaged public var descr: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var wantedBy: UserMO?

}
