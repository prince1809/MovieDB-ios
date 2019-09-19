//
//  UpcomingMovieCellViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

final class UpcomingMovieCellViewModel {
    
    var title: String
    var releaseDate: String
    var posterURL: URL?
    var backdropURL: URL?
    
    init(_ movie: Movie) {
        title = movie.title
        releaseDate = movie.releaseDate
        posterURL = movie.posterURL
        backdropURL = movie.backdropURL
    }
}
