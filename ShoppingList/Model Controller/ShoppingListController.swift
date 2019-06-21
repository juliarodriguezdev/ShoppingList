//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by julia rodriguez on 6/21/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListController {
    
    // Singleton, sharedInstance
    static let sharedInstance = ShoppingListController()
    
    // Source of Truth 
    var items: [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    // CRUD Functions
    
    // Create
    func add(itemWithName name: String, isComplete: Bool = false) {
        // set default image to incomplete
        Item(name: name, isComplete: isComplete)
    }
    // Update
    func update(item: Item, name: String, isComplete: Bool) {
        Item(name: name, isComplete: isComplete)
    }
    // Remove
    func remove(item: Item) {
        
    }
    // Save
    func saveToPersistentStore() {
        
    }
    // toggle function
    func toggleIsComplete(item: Item) {
        item.isComplete = !item.isComplete
    }
}
