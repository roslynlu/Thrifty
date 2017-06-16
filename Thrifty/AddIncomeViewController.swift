//
//  AddIncomeViewController.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/15/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class AddIncomeViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var daysCycleField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    
    
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
    
    
    
    
    
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        
        if (nameField.text != "" &&
            typeField.text != "" &&
            amountField.text != "" &&
            daysCycleField.text != "") {
            
            let context = getContext()
            
            
            let newIncome = TransactionInfo(daysCycle: Double(daysCycleField.text!)!,
                                            amount: Double(amountField.text!)!,
                                            date: dateField.date as NSDate,
                                            descr: nameField.text!,
                                            id: UUID().uuidString,
                                            type: Double(amountField.text!)! >= 0 ? "income" : "expense",
                                            amountSoFar: Double(amountField.text!)!,
                                            category: typeField.text!)

            
            _ = UserMO.getActiveUser(context)?.createNewTransaction(with: newIncome, in: context)
            
            self.dismiss(animated: true, completion: nil)
        }
        else {
            let dataAlert = UIAlertController(title: "Error", message: "Make sure all data fields have data", preferredStyle: UIAlertControllerStyle.alert)
            dataAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(dataAlert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
}
