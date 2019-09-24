//
//  ListResult.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/24.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

struct ListResult: Decodable, Paginable {
    
    let results: [List]
    var currentPage: Int
    var totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case results
        case currentPage = "page"
        case totalPages = "total_pages"
    }
}
