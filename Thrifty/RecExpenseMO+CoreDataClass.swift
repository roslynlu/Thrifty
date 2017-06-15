//
//  RecExpenseMO+CoreDataClass.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/15/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData

@objc(RecExpenseMO)
public class RecExpenseMO: NSManagedObject {
    
    class func recExpenseWithInfo(_ info: ExpenseInfo, inMOContext context: NSManagedObjectContext) -> RecExpenseMO? {
        let request: NSFetchRequest<RecExpenseMO> = RecExpenseMO.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", info.id)
        
        if let expense = (try? context.fetch(request))?.first {
            return expense
        }
        else {
            
            let expense = RecExpenseMO(context: context)
            expense.id = info.id
            expense.type = info.type
            expense.descr = info.descr
            expense.amount = info.amount
            expense.daysCycle = info.daysCycle
            expense.date = info.date
            expense.plannedToBeSpentBy = UserMO.userWithName(info.spentBy, inMOContext: context)
            
            try! context.save()
            
            return expense
        }
    }

}
