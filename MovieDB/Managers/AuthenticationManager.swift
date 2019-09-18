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
    
    lazy var apiKey: String = {
        let keys = retrieveKeys()
        return keys.apiKey
    }()
    
    // MARK: - Initializers
    
    init() {
        setupStores()
    }
    
    // MARK: - Private
    
    private func setupStores() {
        let context = PersistenceManager.shared.mainContext
        userStore = PersistenceStore(context)
    }
    
    // MARK: - TheMovieDB keys
    private func retrieveKeys() -> Keys {
        guard let url = Bundle.main.url(forResource: "TheMovieDb", withExtension: ".plist") else {
            fatalError()
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let plist = try decoder.decode([String: Keys].self, from: data)
            guard let keys = plist["Keys"] else {
                fatalError()
            }
            return keys
        } catch {
            fatalError()
        }
    }
}
