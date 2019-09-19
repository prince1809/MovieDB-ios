//
//  Paginable.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

protocol Paginable {
    
    var currentPage: Int { get set }
    var totalPages: Int { get set }
    
}

extension Paginable {
    
    var hasMorePages: Bool {
        return currentPage < totalPages
    }
    
    var nextPage: Int {
        return hasMorePages ? currentPage + 1 : currentPage
    }
}
