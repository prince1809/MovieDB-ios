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
    private var requestToken: String?
    
    var showAuthPermission: (() -> Void)?
    var didSignIn: (() -> Void)?
    var didReceiveError: (() -> Void)?
    
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
    
    func getRequestToken() {
        let readAccessToken = authManager.readAccessToken
        authClient.getRequestToken(with: readAccessToken) { result in
            switch result {
            case .success(let requestToken):
                self.requestToken = requestToken.token
                self.showAuthPermission?()
            case .failure(let error):
                print(error.description)
                self.didReceiveError?()
            }
            
        }
    }
    
    // MARK: - View Model building
    
    func buildAuthPermissionViewModel() -> AuthPermissionViewModel? {
        guard let requestToken = requestToken else { return nil }
        return AuthPermissionViewModel(requestToken: requestToken)
    }
}
