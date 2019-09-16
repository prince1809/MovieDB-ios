//
//  MoviesViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

enum MovieListFilter {
    case upcoming, popular, topRated
    case similar (movieId: Int)
    case byGenre(genreId: Int)
    
    var title: String? {
        switch self {
        case .upcoming:
            return "Upcoming Movies"
        case .popular:
            return "Popular Movies"
        case .topRated:
            return "Top Rated Movies"
        case .similar:
            return "Similar Movies"
        case .byGenre(let genreId):
            let genre = PersistenceManager.shared.findGenre(with: genreId)
            return genre?.name
        }
    }
}

protocol MoviesViewModel {
    
    associatedtype MovieCellViewModel
    
    var managedObjectContext: NSManagedObjectContext { get set }
    
    var movieClient: MovieClient { get }
    var viewState: Bindable<SimpleViewState<Movie>> { get set }
    var filter: MovieListFilter { get set }
    
    var movieCells: [MovieCellViewModel] { get }
    var movies: [Movie] { get }
    
    var startLoading: Bindable<Bool> { get set }
    
}

extension MoviesViewModel {
    
    var movies: [Movie] {
        return viewState.value.currentEntities
    }
    
}
