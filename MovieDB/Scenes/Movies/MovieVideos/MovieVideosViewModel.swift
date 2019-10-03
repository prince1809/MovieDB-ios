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
    let viewState: Bindable<SimpleViewState<Video>> = Bindable(.initial)
    
    var startLoading: Bindable<Bool> = Bindable(false)
    
    var videoCells: [MovieVideoCellViewModel] {
        return videos.map { MovieVideoCellViewModel($0) }
    }
    
    private var videos: [Video] {
        return viewState.value.currentEntities
    }
    
    // MARK: - Initializers
    
    init(movieId: Int, movieTitle: String) {
        self.movieId = movieId
        self.movieTitle = movieTitle
    }
    
    // MARK: - Public
    
    func playVideo(at index: Int) {
        
    }
    
    // MARK: - Networking
    
    func getMovieVideos(showLoader: Bool = false) {
        startLoading.value = showLoader
        movieClient.getMovieVideos(with: movieId) { result in
            switch result {
            case .success(let videoResult):
                guard let videoResult = videoResult else { return }
                self.processVideoResult(videoResult)
            case .failure(let error):
                self.viewState.value = .error(error)
            }
        }
    }
    
    private func processVideoResult(_ videoResult: VideoResult) {
        startLoading.value = false
        let fetchedVideos = videoResult.results
        if fetchedVideos.isEmpty {
            viewState.value = .empty
        } else {
            viewState.value = .populated(fetchedVideos)
        }
    }
}
