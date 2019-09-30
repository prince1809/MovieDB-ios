//
//  MovieReviewsViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/30.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation


final class MovieReviewsViewModel {
    
    let movieId: Int
    let movieTitle: String
    
    var movieClient = MovieClient()
    //let viewState: Bindable<SimpleViewState<Reviews>> = Bindable(.initial)
    
    // MARK: - Initializers
    
    init(movieId: Int, movieTitle: String) {
        self.movieId = movieId
        self.movieTitle = movieTitle
    }
}
