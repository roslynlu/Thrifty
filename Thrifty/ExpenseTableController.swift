//
//  TVController.swift
//  CIS55Lab2_Boris
//
//  Created by Boris Teodorovich on 5/15/17.
//  Copyright © 2017 Boris Teodorovich. All rights reserved.
//

import UIKit
import CoreData


class ExpenseTableController: UITableViewController, UISearchResultsUpdating, NSFetchedResultsControllerDelegate {
    
    
    
    var myInfo = userInfo()
    var firstTime: Bool = false
    
    
    
    
    
    // Overriding inherited property
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    // Main array for storing Animals
    var expenses: [ExpenseMO] = []
    
    // Stuff for the section labels
    var expenseDict = [String: [ExpenseMO]]()
    var sectionTitles = [String]()
    
    // Search controller
    var searchController: UISearchController!
    var searchResults: [ExpenseMO] = []
    
    
    
    
    
    // Auto Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Search bar setup
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.sizeToFit()
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = self.searchController.searchBar
        
        
        
        fetchFromCD()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchFromCD()
        self.tableView.reloadData()
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
        
        if let fetchedObjects = controller.fetchedObjects {
            expenses = fetchedObjects as! [ExpenseMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    
    
    
    // Sorting and searching
    func filterContentFor(searchText: String) {
        searchResults = expenses.filter({ (expense: ExpenseMO) -> Bool in
            let nameMatch = expense.name?.range(of: searchText, options: String.CompareOptions.caseInsensitive)

            return (nameMatch != nil)
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let textToSearch = searchController.searchBar.text {
            filterContentFor(searchText: textToSearch)
            tableView.reloadData()
        }
    }
    
    
    
    
    
    // Sections

    // On the side
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if searchController.isActive {
            return [""]
        }
        else {
            return sectionTitles
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive {
            return 1
        }
        else {
            return sectionTitles.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        }
        else if let expenseValues = expenseDict[sectionTitles[section]] {
            return expenseValues.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchController.isActive {
            return "Search Results"
        }
        else {
            return sectionTitles[section]
        }
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if let index = sectionTitles.index(of: title) {
            return index
        }
        return -1
    }
    
    
    
    // Cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "ExpenseCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ExpenseCell
        
        if let expenseValues = expenseDict[sectionTitles[indexPath.section]] {
            let cellItem = searchController.isActive ? searchResults[indexPath.row] : expenseValues[indexPath.row]
            updateCellContents(in: cell, with: cellItem)
        }
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
            
        case .delete:
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = appDelegate.persistentContainer.viewContext
                if let itemToDelete = expenseDict[sectionTitles[indexPath.section]]?[indexPath.row] {
                    context.delete(itemToDelete)
                }
                appDelegate.saveContext()
                fetchFromCD()
                tableView.reloadData()
            }
            //case .insert:
        //         Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        default: break
        }
        
    }
    
    

    
    
    
    
    
    
    
    // My methods
    func fetchFromCD() {
        
        
        var fetchResultsController: NSFetchedResultsController<ExpenseMO>!
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let fetchRequest:NSFetchRequest<ExpenseMO> = ExpenseMO.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
            let context = appDelegate.persistentContainer.viewContext
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultsController.delegate = self
        }
        
        
        // Fetch animals into "exenses" array
        
        do {
            try fetchResultsController.performFetch()
            if let fetchedObjects = fetchResultsController.fetchedObjects {
                expenses = fetchedObjects
                expenseDict = [:]
                sectionTitles = []
                for expense in fetchedObjects {
                    addToDict(expense)
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    func addToDict(_ expense: ExpenseMO) {
        
        if let keyChar = (expense.name?[(expense.name?.startIndex)!]) {
            let key = String(keyChar)
            
            if var expensesWithSameFirstLetter = expenseDict[key] {
                expensesWithSameFirstLetter.append(expense)
                expenseDict[key] = expensesWithSameFirstLetter
            }
            else {
                expenseDict[key] = [expense]
            }
        }
        
        
        sectionTitles = [String](expenseDict.keys)
        sectionTitles.sort()
    }

    
    func updateCellContents(in cell: ExpenseCell, with cellItem: ExpenseMO) {
        
        
        cell.imageField.image = #imageLiteral(resourceName: "noImage")
        
        cell.nameField.text = cellItem.name
        cell.typeField.text = cellItem.type
    }
    
}

