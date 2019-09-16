//
//  Keys.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

/// Decodable Struct retrieves the read access token and api key from a property list
struct Keys: Decodable {
    
    let readAccessToken: String
    let apiKey: String
    
    private enum CodingKeys: String, CodingKey {
        case readAccessToken = "ReadAccessToken"
        case apiKey = "ApiKey"
    }
}
