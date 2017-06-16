//
//  SetSavingsViewController.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/9/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class SetSavingsViewController: UIViewController {

    
    var firstTime: Bool = true
    var percent : Double = 0.0
    
    @IBOutlet weak var percentOutput: UILabel!
    @IBOutlet var percentageSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slidSlider(_ sender: UISlider)
    {
        percentOutput.text = (String(format: "%d%@", Int(percentageSlider.value), "%"))
    }

    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        percent = Double(percentageSlider.value/100)
        print(percent)
        //save percent var to core data
        
        navigationController?.dismiss(animated: false, completion: nil)
    }

}
