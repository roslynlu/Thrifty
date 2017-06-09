//
//  SetSavingsViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class SetSavingsViewController: UIViewController {

    var myInfo = startingInfo()
    
    var dollarSavings : Double = 0
    
    @IBOutlet var inputSavings: UITextField!
    @IBOutlet var percentageSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func slidSlider(_ sender: UISlider) {
        dollarSavings = (Double(percentageSlider.value)/100) * myInfo.income
        inputSavings.text = String(dollarSavings)
    }
    @IBAction func changedText(_ sender: Any) {
        dollarSavings = (inputSavings.text! as NSString).doubleValue
        percentageSlider.setValue(Float(dollarSavings/myInfo.income)*100.0, animated: true)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        myInfo.savings = dollarSavings
//            Double(roundf(self.percentageSlider!.value))
        
        if segue.identifier == "SavingToConfirmation" {
            let confirmationVC = segue.destination as! SavingStartingInfoViewController
            confirmationVC.myInfo = myInfo
        }
    }

}
