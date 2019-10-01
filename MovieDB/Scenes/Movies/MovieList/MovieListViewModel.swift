//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/01.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

final class MovieListViewModel: MoviesViewModel {
   
    var movieClient = MovieClient()
    
    var managedObjectContext: NSManagedObjectContext
    var filter: MovieListFilter
    
    var startLoading: Bindable<Bool> = Bindable(false)
    var viewState: Bindable<SimpleViewState<Movie>> = Bindable(.initial)
    
    // MARK: - Computed Properties
    
    var movieCells: [MovieCellViewModel] {
        return movies.compactMap { MovieCellViewModel($0) }
    }
    
    // MARK: - Initializers
    
    init(filter: MovieListFilter = .upcoming, managedObjectContext: NSManagedObjectContext) {
        self.filter = filter
        self.managedObjectContext = managedObjectContext
    }
    
}
