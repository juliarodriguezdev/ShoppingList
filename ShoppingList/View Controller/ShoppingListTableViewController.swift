//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by julia rodriguez on 6/21/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit
import UserNotifications

class ShoppingListTableViewController: UITableViewController, ItemTableViewCellDelegate {

    func buttonCellButtonTapped(_ sender: ItemTableViewCell) {
        guard let index = tableView.indexPath(for: sender) else { return }
        let item = ShoppingListController.sharedInstance.items[index.row]
        ShoppingListController.sharedInstance.toggleIsComplete(item: item)
        tableView.reloadData()
    }
    
    fileprivate let userNotificationIdentifier = "ItemCreationNotification"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ShoppingListController.sharedInstance.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }

        let item = ShoppingListController.sharedInstance.items[indexPath.row]
        
        //cell.textLabel?.text = item.name
        cell.update(withItem: item)
        cell.delegate = self
    
        return cell
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        displayAddItemAlertController()

        
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let targetItem = ShoppingListController.sharedInstance.items[indexPath.row]
            ShoppingListController.sharedInstance.remove(item: targetItem)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ShoppingListTableViewController {
    func displayAddItemAlertController() {
        let alertController = UIAlertController(title: "Add Shopping List Item", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.text = ""
        }
        let addAction = UIAlertAction(title: "Save", style: .default) { (_) in
            guard let itemText = alertController.textFields?.first?.text else {return}
            
            _ = ShoppingListController.sharedInstance.add(itemWithName: itemText)
        }
        alertController.addAction(addAction)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    func cancelLocalNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [userNotificationIdentifier])
    }
}
