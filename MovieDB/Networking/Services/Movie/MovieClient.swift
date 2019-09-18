//
//  MovieClient.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//


import Foundation
import CoreData

class MovieClient: APIClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    // MARK: - Movie list
    
    func getMovies(page: Int, filter: MovieListFilter, completion: @escaping (Result<MovieResult?, APIError>) -> Void) {
        //let request = getMovieListRequest
    }
    
//    private func getMovieListRequest(with filter: MovieListFilter, page: Int) -> URLRequest {
////        switch filter {
////        case .upcoming:
////            return MovieProvider.getUpcoming(page: <#T##Int#>)
////        default:
////            <#code#>
////        }
//    }
}
