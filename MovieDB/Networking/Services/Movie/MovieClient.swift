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
        let request = getMovieListRequest(with: filter, page: page)
        fetch(with: request, decode: { json -> MovieResult? in
            guard let movieResult = json as? MovieResult else { return nil }
            return movieResult
        }, completion: completion)
    }
    
    private func getMovieListRequest(with filter: MovieListFilter, page: Int) -> URLRequest {
        switch filter {
        case .upcoming:
            return MovieProvider.getUpcoming(page: page).request
        case .popular:
            return MovieProvider.getPopular(page: page).request
        case .topRated:
            return MovieProvider.getTopRated(page: page).request
        case .byGenre(let genreId):
            return MovieProvider.getByGenreId(page: page, genreId: genreId).request
        case .similar(let movieId):
            return MovieProvider.getSimilars(page: page, id: movieId).request
        }
    }
    
    // MARK: - Movie Detail
    
    func getMovieDetail(_ context: NSManagedObjectContext, with movieId: Int, completion: @escaping (Result<Movie, APIError>) -> Void) {
        fetch(with: MovieProvider.getDetail(id: movieId).request,
              context: context,
              decode: { json -> Movie? in
                guard let movie = json as? Movie else { return nil }
                return movie
        },completion: completion)
    }
}
