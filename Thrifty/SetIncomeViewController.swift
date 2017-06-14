//
//  SetIncomeViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class SetIncomeViewController: UIViewController {

    
    var firstTime: Bool = false
    
    //Outlets
    @IBOutlet var inputIncome: UITextField!
    @IBOutlet weak var mainButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if firstTime {
            mainButton.setTitle("Next", for: UIControlState.normal)
        }
        else {
            mainButton.setTitle("Save", for: UIControlState.normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func mainButtonClicked(_ sender: UIButton) {
        
       // myInfo.income = (inputIncome.text! as NSString).doubleValue

        if firstTime {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpenseTable") as! ExpenseTableController

            present(viewController, animated: true, completion: nil)
            
        }
        else {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SaveUserInfo") as! SavingStartingInfoViewController
            present(viewController, animated: true, completion: nil)
        }
    }


}
