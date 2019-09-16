//
//  MovieProvider.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

enum MovieProvider {
    
    case getUpcoming(page: Int)
    
}

// MARK: - Endpoint

extension MovieProvider: Endpoint {
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .getUpcoming:
            return "/3/movie/upcoming"
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var params: [String : Any]? {
        switch self {
        case .getUpcoming(let page):
            return ["page": page]
        }
    }
    
    var paramterEncoding: ParameterEncoding {
        return .defaultEncoding
    }
    
    var method: HTTPMethod {
        return .get
    }
}
