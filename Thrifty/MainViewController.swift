//
//  MainViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData
import QuartzCore

class MainViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    // OUTLETS
    @IBOutlet weak var greeting: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet var dailyBudget: UILabel!
    
    var dailyBudgetDollars: Double = 0
    var numDaysInMonth: Double = 30
    var netMonthlyIncome: Double = 0
    var expenses : Double = 0
    var user : UserMO!
    
    //DO LATER
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //format buttons
        minusButton.layer.cornerRadius = 0.5 * minusButton.bounds.size.width;
        minusButton.layer.borderWidth = 2.0
        minusButton.layer.borderColor = UIColor.white.cgColor
        minusButton.titleEdgeInsets.left = 12;
        
        plusButton.layer.cornerRadius = 0.5 * minusButton.bounds.size.width;
        plusButton.layer.borderWidth = 2.0
        plusButton.layer.borderColor = UIColor.white.cgColor
        plusButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        //fetch user from CoreData into local var user and set greeting label
        user = UserMO.getActiveUser(getContext())
        print("name is " + (user.name)!)
        greeting.text = "Hello " + (user.name)! + ","
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let budget = user.calculateDailyBudget(Date(), context: getContext())
        dailyBudget.text = String(format: "$%.2f", budget)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // Fetches data and stores it in myInfo
//    func loadData() {
//        let fetchRequest : NSFetchRequest<UserMO> = UserMO.fetchRequest()
//        do {
//            let fetchedObjects = try getContext().fetch(fetchRequest)
//                myInfo = fetchedObjects.first
//        }
//        catch {
//            print(error)
//        }
//    }
    

}
