//
//  PersistenceStore+User.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/25.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

extension PersistenceStore where Entity == User {
    
    func find(with id: Int) -> User? {
        let predicate = NSPredicate(format: "id == %d", id)
        return User.findOrFetch(in: managedObjectContext, matching: predicate)
    }
}
