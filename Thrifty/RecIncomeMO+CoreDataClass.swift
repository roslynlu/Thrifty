//
//  RecIncomeMO+CoreDataClass.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/15/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData

@objc(RecIncomeMO)
public class RecIncomeMO: NSManagedObject {

    class func recIncomeWithInfo(_ info: IncomeInfo, inMOContext context: NSManagedObjectContext) -> RecIncomeMO? {
        let request: NSFetchRequest<RecIncomeMO> = RecIncomeMO.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", info.id)
        
        if let income = (try? context.fetch(request))?.first {
            return income
        }
        else {
            
            let income = RecIncomeMO(context: context)
            income.id = info.id
            income.type = info.type
            income.descr = info.descr
            income.amount = info.amount
            income.daysCycle = info.daysCycle
            income.date = info.date
            income.plannedToBeReceivedBy = UserMO.userWithName(info.receivedBy, inMOContext: context)
            
            try! context.save()
            
            return income
        }
    }
}
