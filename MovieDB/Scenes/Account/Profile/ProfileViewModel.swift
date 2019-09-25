//
//  ProfileViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/26.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

final class ProfileViewModel {
    
    private var managedObjectContext: NSManagedObjectContext
    private var userStore: PersistenceStore<User>!
    
    private let accountClient = AccountClient()
    
    let viewState: Bindable<ProfileViewState> = Bindable(.initial)
    
    var reloadAccountInfo: (() -> Void)?
    
    private var userAccount: User?
    
    //var userInfoCell: ProfileAccount
    
    private let collectionOptions: [ProfileCollectionOption]
    
    private let groupOptions: [ProfileGroupOption]
    
    
    init(_ managedObjectContext: NSManagedObjectContext, userAccount: User?, options: ProfileOptions) {
        self.managedObjectContext = managedObjectContext
        self.userAccount = userAccount
        self.collectionOptions = options.collectionOptions
        self.groupOptions = options.groupOptions
        setupStores()
    }
    
    // MARK: - Private
    
    private func setupStores() {
        userStore = PersistenceStore(managedObjectContext)
        userStore.configureResultsController(notifyChangesOn: [.insert])
        userStore.delegate = self
    }
    
}

// MARK: - View Sections

extension ProfileViewModel {
    enum ProfileSection {
        /// Section to show the profile user info
        case accountInfo
        
        /// Shows the user's collections like favorites
        case collections
        
        /// Shows the user's created lists
        case groups
        
        /// Shows the sign out Button
        case signOut
    }
    
    func section(at index: Int) -> ProfileSection {
        return viewState.value.sections[index]
    }
}

// MARK: - View States

extension ProfileViewModel {
    
    enum ProfileViewState {
        
        case initial
        
        var sections: [ProfileSection] {
            switch self {
            case .initial:
                return [.accountInfo, .collections, .groups, .signOut]
            }
        }
    }
}


// MARK: - PersistenceStoreDelegate

extension ProfileViewModel: PersistenceStoreDelegate {
    
    func persistenceStore(willUpdateEntity shouldPrepare: Bool) { }
    
    func persistenceStore(didUpdateEntity update: Bool) {
        
        
    }
}
