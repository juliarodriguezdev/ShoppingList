//
//  ShoppingList+Convenience.swift
//  ShoppingList
//
//  Created by julia rodriguez on 6/21/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    
    @discardableResult
    
    convenience init(name: String, isComplete: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.isComplete = isComplete
    }
}
