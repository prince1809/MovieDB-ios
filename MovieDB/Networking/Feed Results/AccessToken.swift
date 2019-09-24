//
//  AccessToken.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/24.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

struct AccessToken: Decodable {
    
    let token: String
    let accountId: String
    
    private enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case accountId = "account_id"
    }
}
