//
//  TransactionMO+CoreDataClass.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/15/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import Foundation
import CoreData

@objc(TransactionMO)
public class TransactionMO: NSManagedObject {
    
    class func transaction(with info: TransactionInfo, by user: UserMO, in context: NSManagedObjectContext) -> TransactionMO? {
        let request: NSFetchRequest<TransactionMO> = TransactionMO.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", info.id)
        
        if let transaction = (try? context.fetch(request))?.first {
            return transaction
        }
        else {
            
            let newTransaction = TransactionMO(context: context)
              newTransaction.daysCycle = info.daysCycle
              newTransaction.amount = info.amount
              newTransaction.date = info.date
              newTransaction.descr = info.descr
              newTransaction.id = info.id
              newTransaction.type = info.type
              newTransaction.amountSoFar = info.amountSoFar
              newTransaction.category = info.category
              newTransaction.owner = user

            
            try! context.save()
            
            return newTransaction
        }
    }
    
    func delete(from context: NSManagedObjectContext) {
        context.delete(self)
        try! context.save()
    }
    

}
