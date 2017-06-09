//
//  SetIncomeViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class SetIncomeViewController: UIViewController {

    @IBOutlet var inputIncome: UITextField!

    var myInfo = startingInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func setYourIncome(_ sender: Any) {
//        myInfo.income = (inputIncome.text! as NSString).doubleValue
//        print("my income is \(myInfo.income)")
//    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        myInfo.income = (inputIncome.text! as NSString).doubleValue
        print("my income is \(myInfo.income)")
        
        if segue.identifier == "IncomeToExpenses" {
            let expensesVC = segue.destination as! SetRecurringExpensesViewController
            print("my income in prepare is \(myInfo.income)")
            expensesVC.myInfo = myInfo
        }
    }

}
