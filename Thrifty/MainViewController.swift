//
//  MainViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, NSFetchedResultsControllerDelegate {

    var myInfo : UserMO!
    var fetchResultsController : NSFetchedResultsController<UserMO>!

    
    @IBOutlet var dailyBudget: UILabel!
    
    var dailyBudgetDollars: Double = 0
    var numDaysInMonth : Double = 30
    var netMonthlyIncome : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                    }
                    
                }
            }
            catch
            {
                print(error)
            }
        }
        
        //monthly income, subtract recurring expenses and subtract savings
        //
        netMonthlyIncome = myInfo.income - myInfo.recurringExpenses - myInfo.savings
        dailyBudgetDollars = netMonthlyIncome/numDaysInMonth
        
        dailyBudget.text = String(dailyBudgetDollars)
        
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
