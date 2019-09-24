//
//  ProfileOptions.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/24.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

/**
 * A profile option can be a Colleciton( referred to the user movie
 * collections like favorites), a Group(referred to the option that
 * redirects to a group of collections and not to a plain movie list)
 * or a configuraiton which represents account settings by the user.
 */
struct ProfileOptions {
    
    let collectionOptions: [ProfileCollectionOption]
    let groupOptions: [ProfileGroupOption]
    let configurationOptions: [ProfileConfigurationOption]
    
}

protocol ProfileOption {
    
    var title: String? { get }
    
}


enum ProfileCollectionOption: ProfileOption {
    
    case favorites, watchlist

    var title: String? {
        switch self {
        case .favorites:
            return NSLocalizedString("favoritesCollectionOption", comment: "")
        case .watchlist:
            return NSLocalizedString("watchlistCollectionOption", comment: "")
        }
    }
}

enum ProfileGroupOption: ProfileOption {
    
    case customLists
    
    var title: String? {
        switch self {
        case .customLists:
            return NSLocalizedString("customListGroupOption", comment: "")
        }
    }
}

enum ProfileConfigurationOption: ProfileOption {
    case includeAdult
    
    var title: String? {
        switch self {
        case .includeAdult:
            return NSLocalizedString("includeAdults", comment: "")
        }
    }
}
