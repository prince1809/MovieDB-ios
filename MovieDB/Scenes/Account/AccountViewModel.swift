//
//  AccountViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

final class AccountViewModel {
    
    private var managedObjectContext: NSManagedObjectContext
    private var authManager: AuthenticationManager
    
    private var authClient = AuthClient()
    private let accountClient = AccountClient()
    
    // MARK: - Initializers
    init(managedObjectContext: NSManagedObjectContext = PersistenceManager.shared.mainContext,
         authManager: AuthenticationManager = AuthenticationManager.shared) {
        self.managedObjectContext = managedObjectContext
        self.authManager = authManager
    }
    
    // MARK: - Authentication
    
    func isUserSignedIn() -> Bool {
        return authManager.isUserSignedIn()
    }
}
