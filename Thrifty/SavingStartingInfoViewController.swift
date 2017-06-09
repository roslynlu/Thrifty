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

    var myInfo = startingInfo()
    var userInfo : UserMO!
    
    var fetchResultsController : NSFetchedResultsController<UserMO>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveToCoreData()
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func saveToCoreData ()
    {
        //TODO: way to save data without just appending to array, should delete previous values
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
        {
            userInfo = UserMO(context: appDelegate.persistentContainer.viewContext)
            
            userInfo.income = myInfo.income
            userInfo.recurringExpenses = myInfo.recurringExpenses
            userInfo.savings = myInfo.savings
            
            appDelegate.saveContext()
        }
    }
    
//    override func viewWillAppear()
//    {
//        saveToCoreData()
//        navigationController?.dismiss(animated: true, completion: nil)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
