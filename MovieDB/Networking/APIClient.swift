//
//  APIClient.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

protocol APIClient {
    
    var session: URLSession { get }
    
    func fetch<T: Decodable>(with request: URLRequest,
                             context: NSManagedObjectContext?,
                             decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {
    
    
}
