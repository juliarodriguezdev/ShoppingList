//
//  CoreDataStack.swift
//  ShoppingList
//
//  Created by julia rodriguez on 6/21/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ShoppingList")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    } ()
    
    static var context: NSManagedObjectContext { return container.viewContext}
}
