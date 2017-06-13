//
//  SetRecurringExpensesViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class SetRecurringExpensesViewController: UIViewController {

    @IBOutlet var inputRecurringExpenses: UITextField!
    @IBOutlet weak var mainButton: UIButton!
    
    var myInfo = userInfo()
    var firstTime: Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if firstTime {
            mainButton.setTitle("Next", for: UIControlState.normal)
        }
        else {
            mainButton.setTitle("Save", for: UIControlState.normal)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
//        print ("income 1.5 is \(income)")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func mainButtonPressed(_ sender: UIButton) {
        
        myInfo.recurringExpenses = (inputRecurringExpenses.text! as NSString).doubleValue
        
        if firstTime {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetSavings") as! SetSavingsViewController
            viewController.myInfo = self.myInfo
            viewController.firstTime = true
            present(viewController, animated: true, completion: nil)
            
        }
        else {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SaveUserInfo") as! SavingStartingInfoViewController
            viewController.myInfo = self.myInfo
            present(viewController, animated: true, completion: nil)
        }
    }
    

//    @IBAction func setRecurringExpenses(_ sender: Any) {
//        myInfo.recurringExpenses = (inputRecurringExpenses.text! as NSString).doubleValue
//        print ("income2 is \(myInfo.income)")
//        print("RE is \(myInfo.recurringExpenses)")
//    }
    

}
