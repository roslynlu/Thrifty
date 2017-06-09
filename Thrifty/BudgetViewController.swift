//
//  BudgetViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class BudgetViewController: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet var setIncome: UIButton!
    
    @IBOutlet var setExpenses: UIButton!
    
    @IBOutlet var setSavings: UIButton!
    
    var myInfo : UserMO!
    var fetchResultsController : NSFetchedResultsController<UserMO>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print ("\(myInfo.income) + \(myInfo.recurringExpenses) + \(myInfo.savings)")
        // Do any additional setup after loading the view.
        //creates a fetch request and sorts data based on attribute
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fetchRequest : NSFetchRequest<UserMO> = UserMO.fetchRequest()
                let sortDescriptor = NSSortDescriptor(key: "income", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
        
        //creates the persistence container context, associates the fetchRequest with the
        //fetchedResultsController
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
        {
            let context = appDelegate.persistentContainer.viewContext
            
            
            
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultsController.delegate = self
            
            //fetches data and stores it in MyToDo
            do
            {
                try fetchResultsController.performFetch()
                if let fetchedObjects = fetchResultsController.fetchedObjects
                {
                    for userInfo in fetchedObjects
                    {
                        myInfo = userInfo
                        setIncome.setTitle(String(myInfo.income), for: .normal)
                        setExpenses.setTitle(String(myInfo.recurringExpenses), for: .normal)
                        setSavings.setTitle(String(myInfo.savings), for: .normal)
                    }
                    
                }
            }
            catch
            {
                print(error)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
