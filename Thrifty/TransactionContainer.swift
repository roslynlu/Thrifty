//
//  TransactionContainer.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/19/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class TransactionContainer: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    var ContainedTableView: TransactionTable?
    
    
    // Stuff for the picker
    static let types: [String] = ["income", "expense"]
    var initType = types.first
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSegmentedControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if ContainedTableView != nil {
            ContainedTableView?.updateTableViewWithNewData()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.removeAllSegments()
        for index in 0..<TransactionContainer.types.count {
            segmentedControl.insertSegment(withTitle: TransactionContainer.types[index].capitalized, at: index, animated: false)
        }
        // Select First Segment
        segmentedControl.selectedSegmentIndex = TransactionContainer.types.index(of: initType!)!
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ContainedTableView = (segue.destination as! TransactionTable)
        ContainedTableView?.type = TransactionContainer.types[segmentedControl.selectedSegmentIndex]
    }
 
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        let AddTypeVC = UIStoryboard(name: "Setup", bundle: nil).instantiateViewController(withIdentifier: "AddTransaction") as! AddTransaction
        
        AddTypeVC.type = TransactionContainer.types[segmentedControl.selectedSegmentIndex]
        
        present(AddTypeVC, animated: true, completion: nil)
    }
    
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        ContainedTableView?.type = TransactionContainer.types[segmentedControl.selectedSegmentIndex]
        ContainedTableView?.updateTableViewWithNewData()
    }
    
    
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
