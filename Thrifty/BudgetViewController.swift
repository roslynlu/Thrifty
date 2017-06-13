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
    
    
    var myInfo : UserMO!
    var fetchResultsController : NSFetchedResultsController<UserMO>!
    
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var expButton: UIButton!
    @IBOutlet weak var savingsButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        updateDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if myInfo == nil {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstTimeSetup")
            present(viewController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func setIncomeClicked(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetIncome") as! SetIncomeViewController
        viewController.myInfo = userInfo(self.myInfo)
        present(viewController, animated: true, completion: nil)
        
    }
    
    @IBAction func setExpClicked(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetRecExp") as! SetRecurringExpensesViewController
        viewController.myInfo = userInfo(self.myInfo)
        present(viewController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func setSavingsClicked(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetSavings") as! SetSavingsViewController
        viewController.myInfo = userInfo(self.myInfo)
        present(viewController, animated: true, completion: nil)
        
    }
    
    func updateDisplay() {
        if myInfo != nil {
            incomeButton.setTitle(String(format: "$%.2f", myInfo.income), for: UIControlState.normal)
            expButton.setTitle(String(format: "$%.2f", myInfo.recurringExpenses), for: UIControlState.normal)
            savingsButton.setTitle(String(format: "$%.2f", myInfo.savings), for: UIControlState.normal)
        }
    }
    
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // Fetches data and stores it in myInfo
    func loadData() {
        let fetchRequest : NSFetchRequest<UserMO> = UserMO.fetchRequest()
        do {
            let fetchedObjects = try getContext().fetch(fetchRequest)
            myInfo = fetchedObjects.first
        }
        catch {
            print(error)
        }
    }
    
}
