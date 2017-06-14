//
//  ExpenseVC.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/12/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class ExpenseVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var inputExpense: UITextField!
    @IBOutlet var typeOfExpense: UIPickerView!
    var types : [String] = [String]()
    var amountExpense : Double = 0.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.typeOfExpense.delegate = self
        self.typeOfExpense.dataSource = self
        
        // Do any additional setup after loading the view.
        types = ["General", "Food", "Transportation", "Shopping", "Groceries", "Entertainment", "Education", "Health", "Family"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveExpense"
        {
            amountExpense = (inputExpense.text! as NSString).doubleValue
        }
    }

}
