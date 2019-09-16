//
//  Endpoint.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var params: [String: Any]? { get }
    var paramterEncoding: ParameterEncoding { get }
    var method: HTTPMethod { get }
}


extension Endpoint {
    
//    var apiKey: String {
//        //return
//    }
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum ParameterEncoding {
    case defaultEncoding
    case jsonEncoding
    case compositeEncoding
}