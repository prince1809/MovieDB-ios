//
//  RequestTokenResult.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/24.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

struct RequestTokenResult: Decodable {
    
    let success: Bool
    let token: String
    
    private enum CodingKeys: String, CodingKey {
        case success
        case token = "request_token"
    }
}
