//
//  SetSavingsViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class SetSavingsViewController: UIViewController {

    
    var firstTime: Bool = false
    var dollarSavings : Double = 0
    
    @IBOutlet var inputSavings: UITextField!
    @IBOutlet var percentageSlider: UISlider!
    @IBOutlet weak var mainButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // This is the last view in the chain, no need to change text from "Save"
        
//        if firstTime {
//            mainButton.setTitle("Next", for: UIControlState.normal)
//        }
//        else {
//            mainButton.setTitle("Save", for: UIControlState.normal)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    
//    @IBAction func slidSlider(_ sender: UISlider) {
//        dollarSavings = (Double(percentageSlider.value)/100) * myInfo.income
//        inputSavings.text = String(format: "$%.2f", dollarSavings)
//    }
//    @IBAction func changedText(_ sender: Any) {
//        dollarSavings = (inputSavings.text! as NSString).doubleValue
//        percentageSlider.setValue(Float(dollarSavings/myInfo.income)*100.0, animated: true)
//    }
//    
//    @IBAction func mainButtonPressed(_ sender: UIButton) {
//        
//        myInfo.savings = dollarSavings
//
//        // Also redundant, but at least it's consistent
//        
//        if firstTime {
//            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SaveUserInfo") as! SavingStartingInfoViewController
//            viewController.myInfo = self.myInfo
//            present(viewController, animated: true, completion: nil)
//            
//        }
//        else {
//            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SaveUserInfo") as! SavingStartingInfoViewController
//            viewController.myInfo = self.myInfo
//            present(viewController, animated: true, completion: nil)
//        }
//    }

}
