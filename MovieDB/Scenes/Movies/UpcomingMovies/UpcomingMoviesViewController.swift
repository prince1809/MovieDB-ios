//
//  UpcomingMoviesViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/14.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UIViewController {
    
    @IBOutlet weak var toggleGridBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var navigationManager: UpcomingMoviesNavigationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Private
    
    private func setupUI() {
        title = Constants.Title
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationManager = UpcomingMoviesNavigationManager(verticalSafeAreaOffset: view.safeAreaInsets.left)
        navigationItem.title = Constants.NavigationItemTitle
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.registerNib(cellType: UpcomingMoviePreviewCollectionViewCell.self)
        //collectionView.registerNib(cellType: UpcomingMoviePreviewCollectionViewCell)
    }
    
}

// MARK: - UICollectionViewDelegate

extension UpcomingMoviesViewController: UICollectionViewDelegate {
    
}

// MARK: - Constants

extension UpcomingMoviesViewController {
    
    struct Constants {
        
        static let Title = NSLocalizedString("upcomingMoviesTabBarTitle", comment: "")
        static let NavigationItemTitle = NSLocalizedString("upcomingMoviesTitle", comment: "")
        
        static let previewCellHeight: Double = 150.0
        static let detailCellHeight: Double = 200.0
        static let detailCellOffset: CGFloat = 32.0
    }
}
