//
//  PersistenceStore.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

protocol PersistenceStoreDelegate: class {
    
    func persistenceStore(willUpdateEntity shouldPrepare: Bool)
    func persistenceStore(didUpdateEntity update: Bool)
    
}

class PersistenceStore<Entity: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext
    
    private var fetchedResultsController: NSFetchedResultsController<Entity>!
    private var changeTypes: [NSFetchedResultsChangeType]!
    
    weak var delegate: PersistenceStoreDelegate?
    
    var enetities: [Entity] {
        return fetchedResultsController.fetchedObjects ?? []
    }
    
    // MARK: - Initializers
    
    init(_ managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        super.init()
    }
    
}
