//
//  ExpenseMO+CoreDataClass.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/14/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData

@objc(ExpenseMO)
public class ExpenseMO: NSManagedObject {
    

    
    class func expenseWithInfo(_ info: ExpenseInfo, inMOContext context: NSManagedObjectContext) -> ExpenseMO? {
        let request: NSFetchRequest<ExpenseMO> = ExpenseMO.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", info.id)
        
        if let expense = (try? context.fetch(request))?.first {
            return expense
        }
        else {
            
            let expense = ExpenseMO(context: context)
            expense.id = info.id
            expense.type = info.type
            expense.descr = info.descr
            expense.amount = info.amount
            expense.daysCycle = info.daysCycle
            expense.date = info.date
            expense.spentBy = UserMO.userWithName(info.spentBy, inMOContext: context)
            
            try! context.save()
            
            return expense
        }
    }
    
}
