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
    
    private var viewModel = UpcomingMoviesViewModel()
    
    //private var dataSource:
    
    private var previewLayout: VerticalFlowLayout!
    private var detailLayout: VerticalFlowLayout!
    
    private var navigationManager: UpcomingMoviesNavigationManager!
    
    
    private var isAnimatingPresentation: Bool = false
//    private var presentationMode:
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
    }
    
    
    // MARK: - Private
    
    private func setupUI() {
        title = Constants.Title
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar() {
        navigationManager = UpcomingMoviesNavigationManager(verticalSafeAreaOffset: view.safeAreaInsets.left)
        navigationItem.title = Constants.NavigationItemTitle
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.registerNib(cellType: UpcomingMoviePreviewCollectionViewCell.self)
        //collectionView.registerNib(cellType: UpcomingMoviePreviewCollectionViewCell)
        setupCollectionViewLayout()
    }
    
    private func setupCollectionViewLayout() {
        let detailLayoutWidth = Double(collectionView.frame.width - Constants.detailCellOffset)
        detailLayout = VerticalFlowLayout(width: detailLayoutWidth, height: Constants.detailCellHeight)
        
        let previewLayoutWidth = Constants.previewCellHeight / Movie.posterAspectRatio
        previewLayout = VerticalFlowLayout(width: previewLayoutWidth, height: Constants.previewCellHeight)
        
        collectionView.collectionViewLayout = previewLayout
    }
    
    private func reloadCollectionView() {
        
    }
    
    private func configureView(withState state: SimpleViewState<Movie>) {
        switch state {
        case .populated, .paging, .initial:
            //hide
            collectionView.backgroundView = UIView(frame: .zero)
        case .empty:
             collectionView.backgroundView = UIView(frame: .zero)
        default:
             collectionView.backgroundView = UIView(frame: .zero)
        }
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        viewModel.viewState.bindAndFire({ [weak self] state in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.configureView(withState: state)
                strongSelf.reloadCollectionView()
            }
        })
        viewModel.startLoading.bind({ [weak self] start in
            //start ? self?.showLoader
        })
    }
    
}

// MARK: - UICollectionViewDelegate

extension UpcomingMoviesViewController: UICollectionViewDelegate {
    
}

// MARK: - Presentation Modes

extension UpcomingMoviesViewController {
    
    enum PresentationMode {
        case preview
        case detail
        
        var cellIdentifier: String {
            switch self {
            case .preview:
                return UpcomingMoviePreviewCollectionViewCell.dequeuIdentifier
            case .detail:
                return UpcomingMoviePreviewCollectionViewCell.dequeuIdentifier
            }
        }
    }
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
