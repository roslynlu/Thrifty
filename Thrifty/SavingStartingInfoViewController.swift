//
//  SavingStartingInfoViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class SavingStartingInfoViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    var myInfo = userInfo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveToCoreData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
        present(viewController, animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    func saveToCoreData() {
        let context = getContext()
        
        let fetchRequest : NSFetchRequest<UserMO> = UserMO.fetchRequest()
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            for object in fetchedObjects {
                context.delete(object)
            }
        }
        catch {
            print(error)
        }
        
        let user = UserMO(context: context)
        user.income = myInfo.income
        user.recurringExpenses = myInfo.recurringExpenses
        user.savings = myInfo.savings
        
        
        do {
            try context.save()
            print("saved!")
        }
        catch {
           print(error)
        }
    }

    
    
}
