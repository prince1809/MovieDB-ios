//
//  PersistenceManager.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UpcomingMovies")
        container.loadPersistentStores { _, error in
            guard error == nil else { fatalError() }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        let container = isTesting() ? mockPersistentContainer : persistentContainer
        let context = container.viewContext
        context.mergePolicy = NSMergePolicy.overwrite
        return context
    }
    
    // MARK: - Initializers
    
    init() {
        
    }
    
    // MARK: - Private
    
    private func setupStores() {
        
    }
    
    // MARK: - Test mockups
    
    lazy var mockPersistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UpcomiingMovies")
        return container
    }()
    
    private func isTesting() -> Bool {
        return NSClassFromString("XCTest") != nil
    }
}
