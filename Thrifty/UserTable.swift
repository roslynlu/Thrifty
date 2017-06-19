//
//  UserTable.swift
//  Thrifty
//
//  Created by Boris Teodorovich on 6/16/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData


class UserTable: UITableViewController {

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    // Stuff for the section labels
    var dict = [String: [UserMO]]()
    var sectionTitles = [String]()
    
    
    
    // Auto Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let context = getContext()
//        
//        for failedUser in UserMO.getIncompleteUsers(context)! {
//            context.delete(failedUser)
//            try! context.save()
//        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchFromCD()
        
        self.tableView.reloadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserMO.getActiveUser(getContext()) != nil {
            if (UserMO.getActiveUser(getContext())?.setUpCompleted)! {
                let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
                present(VC, animated: false, completion: nil)
            }
            else {
                let VC = UIStoryboard(name: "Setup", bundle: nil).instantiateViewController(withIdentifier: "BeginSetup")
                present(VC, animated: false, completion: nil)
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    // Updating controller
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                if newIndexPath.startIndex != 0 {
                    tableView.insertRows(at: [newIndexPath], with: .fade)
                }
            }
        case .delete:
            if let indexPath = newIndexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = newIndexPath {
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        //        if let fetchedObjects = controller.fetchedObjects {
        //            expenses = fetchedObjects as! [TransactionMO]
        //        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    
    
    
    
    // Sections
    
    //    // On the side
    //    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    ////        if searchController.isActive {
    ////            return [""]
    ////        }
    ////        else {
    //            return sectionTitles
    ////        }
    //    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let values = dict[sectionTitles[section]] {
            return values.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if let index = sectionTitles.index(of: title) {
            return index
        }
        return -1
    }
    
    
    
    // Cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "UserCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! UserCell
        
        if let values = dict[sectionTitles[indexPath.section]] {
            let cellItem = values[indexPath.row]
            updateCellContents(in: cell, with: cellItem)
        }
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            
            let context = getContext()
            
            if let itemToDelete = dict[sectionTitles[indexPath.section]]?[indexPath.row] {
                UserMO.deleteUser(itemToDelete, context: context)
            }
            
            fetchFromCD()
            tableView.reloadData()
            
        default: break
        }
    }
    
    
    
    
    
    
    
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    func fetchFromCD() {
        dict = [:]
        sectionTitles = []
        
        for user in UserMO.getUsers(getContext()) {
            addToDict(user)
        }
    }
    
    func addToDict(_ user: UserMO) {
        if let key = user.name {
            
            if var valsWithSameFirstLetter = dict[key] {
                valsWithSameFirstLetter.append(user)
                dict[key] = valsWithSameFirstLetter
            }
            else {
                dict[key] = [user]
            }
        }
        
        sectionTitles = [String](dict.keys)
        sectionTitles.sort()
    }
    
    
    func updateCellContents(in cell: UserCell, with cellItem: UserMO) {
        cell.nameField.text = cellItem.name
        
    }
    
    
    
    
    
    // Segue to Detail View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                if let newActiveUser = dict[sectionTitles[indexPath.section]]?[indexPath.row] {
                    
                    newActiveUser.makeActive(getContext())
                }
            }
    }

}
