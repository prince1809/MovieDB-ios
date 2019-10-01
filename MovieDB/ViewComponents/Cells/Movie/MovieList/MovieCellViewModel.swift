//
//  MovieCellViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/01.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

final class MovieCellViewModel {
    
    var name: String?
    var genre: String?
    var releaseDate: String?
    var posterURL: URL?
    var voteAverage: Double?
    
    init(_ movie: Movie) {
        name = movie.title
        genre = movie.genreName
        releaseDate = movie.releaseDate
        voteAverage = movie.voteAverage
        posterURL = movie.posterURL
    }
}
