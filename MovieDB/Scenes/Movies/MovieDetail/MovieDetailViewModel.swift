//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/28.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

final class MovieDetailViewModel {
    
    private var managedObjectContext: NSManagedObjectContext
    //private var movieVisitStore: PersistenceStore<MovieVisit>!
    
    
    var id: Int!
    var title: String!
    var genre: String?
    var releaseDate: String?
    var overview: String?
    var voteAverage: Double?
    var posterPath: String?
    var posterURL: URL?
    var backdropPath: String?
    var backdropURL: URL?
    
    var showErrorView: Bindable<Error?> = Bindable(nil)
    var updateMovieDetail: (() -> Void)?
    var needsFetch = false
    
    var startLoading: Bindable<Bool> = Bindable(false)
    var isFavorite: Bindable<Bool?> = Bindable(false)
    
    // MARK: - Initializers
    
    init(_ movie: Movie, managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        setupStores(self.managedObjectContext)
        setupMovie(movie)
    }
    
    init(id: Int, title: String, managedObjectContext: NSManagedObjectContext) {
        self.id = id
        self.title = title
        self.managedObjectContext = managedObjectContext
        self.needsFetch = true
        setupStores(self.managedObjectContext)
    }
    
    // MARK: - Private
    
    private func setupMovie(_ movie: Movie) {
        id = movie.id
        title = movie.title
        genre = movie.genreName
        releaseDate = movie.releaseDate
        overview = movie.overview
        posterPath = movie.posterPath
        posterURL = movie.posterURL
        backdropPath = movie.backdropPath
        backdropURL = movie.backdropURL
    }
    
    private func setupStores(_ managedObjectContext: NSManagedObjectContext) {
       // movieSto
    }
}
