//
//  SessionResult.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/24.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

struct SessionResult: Decodable {
    
    let success: Bool
    let sessionId: String?
    
    private enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}
