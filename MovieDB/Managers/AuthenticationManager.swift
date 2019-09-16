//
//  AuthenticationManager.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import KeychainSwift

class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    
    private var userStore: PersistenceStore<User>!
    
    // MARK: - Initializers
    
    init() {
        setupStores()
    }
    
    // MARK: - Private
    
    private func setupStores() {
        let context = PersistenceManager.shared.mainContext
        userStore = PersistenceStore(context)
    }
}
