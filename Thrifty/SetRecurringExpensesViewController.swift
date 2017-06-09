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
    
    var myInfo = startingInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
//        print ("income 1.5 is \(income)")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    @IBAction func setRecurringExpenses(_ sender: Any) {
//        myInfo.recurringExpenses = (inputRecurringExpenses.text! as NSString).doubleValue
//        print ("income2 is \(myInfo.income)")
//        print("RE is \(myInfo.recurringExpenses)")
//    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        myInfo.recurringExpenses = (inputRecurringExpenses.text! as NSString).doubleValue

        if segue.identifier == "ExpensesToSavings" {
            let savingsVC = segue.destination as! SetSavingsViewController
            savingsVC.myInfo = myInfo
        }
    }

}
