//
//  AuthPermissionViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/28.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

final class AuthPermissionViewModel {
    
    let requestToken: String
    
    var authPermissionURL: URL? {
        return URL(string: "https://www.themoviedb.org/auth/access?request_token=\(requestToken)")
    }
    
    init(requestToken: String) {
        self.requestToken = requestToken
    }
}
