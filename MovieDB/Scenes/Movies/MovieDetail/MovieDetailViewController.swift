//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/28.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, Retryable, Transitionable, SegueHandler, Loadable {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var transitionContainerView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteAverageView: VoteAverageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    lazy var shareBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareBarButtonAction(_:)))
        return barButtonItem
    }()
    
    var loaderView: RadarView!
    
    var viewModel: MovieDetailViewModel? {
        didSet {
            setupBindables()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        
        guard let viewModel = viewModel, !viewModel.startLoading.value else {
            return
        }
        
    }
    
    // MARK: - Private
    
    private func setupUI() {
        title = "Movie detail"
        setupNavigationBar()
        transitionContainerView.setShadowBorder()
    }
    
    private func setupNavigationBar() {
        let backItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        navigationItem.rightBarButtonItems =  []
    }
    
    private func configureNavigationBar(isFavorite: Bool?) {
        if let isFavorite = isFavorite {
            //favoriteBar
        }
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        setupViewBindables()
    }
    
    private func setupViewBindables() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
        
        backdropImageView.kf.indicatorType = .activity
        backdropImageView.kf.setImage(with: viewModel.backdropURL)
        
        posterImageView.kf.indicatorType = .activity
        posterImageView.kf.setImage(with: viewModel.posterURL)
        
        voteAverageView.voteValue = viewModel.voteAverage
        overviewLabel.text = viewModel.overview
    }
    
    // MARK: - Actions
    
    @IBAction func shareBarButtonAction(_ sender: Any) {
        guard let movieTitle = viewModel?.title else { return }
        let shareText = "Come with me to watch \(movieTitle)!"
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        //viewModel?.
    }
    
    @IBAction func reviewsOptionAction(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifier.movieReviews.rawValue, sender: nil)
    }
    
    @IBAction func trailersOptionAction(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifier.movieVideos.rawValue, sender: nil)
    }
    
    @IBAction func creditsOptionAction(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifier.movieCredits.rawValue, sender: nil)
    }
    
    @IBAction func similarsOptionAction(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifier.movieSimilars.rawValue, sender: nil)
    }
    
    
}


// MARK: - Segue Identifiers

extension MovieDetailViewController {
    
    enum SegueIdentifier: String {
        case movieVideos = "MovieVideosSegue"
        case movieReviews = "MovieReviewSegue"
        case movieSimilars = "MovieSimilarsSegue"
        case movieCredits = "MovieCreditsSegue"
    }
}
