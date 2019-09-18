//
//  UpcomingMoviesViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

final class UpcomingMoviesViewModel: MoviesViewModel {
    
    // MARK: - Properties
    
    var managedObjectContext: NSManagedObjectContext
    
    var movieClient = MovieClient()
    
    var filter: MovieListFilter = .upcoming
    var viewState: Bindable<SimpleViewState<Movie>> = Bindable(.initial)
    var selectedMovieCell: UpcomingMovieCellViewModel?
    
    var startLoading: Bindable<Bool> = Bindable(false)
    
    // MARK: - Computed Properties
    
    var movieCells: [UpcomingMovieCellViewModel] {
        return movies.compactMap { UpcomingMovieCellViewModel($0) }
    }
    
    var needsPrefetch: Bool {
        return viewState.value.needsPrefetch
    }
    
    // MARK: Initializers
    
    init(managedObjectContext: NSManagedObjectContext = PersistenceManager.shared.mainContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    // MARK: - Public
    
    func setSelectedMovie(at index: Int) {
        selectedMovieCell = movieCells[index]
    }
}
