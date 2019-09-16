//
//  File.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    let id: String
    let key: String
    let name: String
    let site: String
}
