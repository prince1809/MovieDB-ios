//
//  MovieVideosViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/03.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

final class MovieVideosViewModel {
    
    let movieId: Int
    let movieTitle: String
    
    
    var movieClient = MovieClient()
    //let viewState: Bindable<SimpleViewState<Video>> = Bindable(.initial)
    
    var startLoading: Bindable<Bool> = Bindable(false)
    
    //var videoCalls: [MovieVideoCellViewModel]
    
    // MARK: - Initializers
    
    init(movieId: Int, movieTitle: String) {
        self.movieId = movieId
        self.movieTitle = movieTitle
    }
    
    // MARK: - Public
    
    func playVideo(at index: Int) {
        
    }
}
