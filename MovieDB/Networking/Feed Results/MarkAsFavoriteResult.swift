//
//  MarkAsFavoriteResult.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/24.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

struct MarkAsFavoriteResult: Decodable {
    
    let statusCode: Int
    let statusMessage: String
    
    private enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
    
}

