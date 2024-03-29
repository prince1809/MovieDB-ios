//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/01.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, PlaceholderDisplayable, SegueHandler, Loadable {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: SimpleTableViewDataSource<MovieCellViewModel>!
    private var prefetchDataSource: TableViewDataSourcePrefetching!
    private var displayedCellsIndexPaths = Set<IndexPath>()
    
    var loaderView: RadarView!
    
    var viewModel: MovieListViewModel? {
        didSet {
            setupBindables()
        }
    }
    
    // MARK: - Lifecycle
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupForceTouchSupport()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
        print("MovieListViewController view loaded")
    }
    
    //MARK: - Private
    
    private func setupUI() {
        setupTableView()
        setupRefreshControl()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.registerNib(cellType: MovieTableViewCell.self)
    }
    
    private func setupRefreshControl() {
        tableView.refreshControl = DefaultRefreshControl(tintColor: ColorPalette.lightBlueColor,
                                                         backgroundColor: tableView.backgroundColor, refreshHandler: { [weak self] in
                                                            self?.viewModel?.refreshMovies()
        })
    }
    
    private func setupForceTouchSupport() {
        if traitCollection.forceTouchCapability == .available {
            //registerForPreviewing(with: self, sourceView: tableView)
        }
    }
    
    private func reloadTableView() {
        guard let viewModel = viewModel else { return }
        dataSource = SimpleTableViewDataSource.make(for: viewModel.movieCells)
        prefetchDataSource = TableViewDataSourcePrefetching(cellCount: viewModel.movieCells.count,
                                                            needsPrefetch: viewModel.needsPrefetch,
                                                            prefetchHandler: { [weak self] in
                                                                self?.viewModel?.getMovies()
        })
        tableView.dataSource = dataSource
        tableView.prefetchDataSource = prefetchDataSource
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing(with: 0.5)
    }
    
    /**
     * Configure the tableview footer given the current state of the view.
     */
    private func configureView(withState state: SimpleViewState<Movie>) {
        switch state {
        case .paging:
            hideDisplayedPlaceholderView()
            tableView.tableFooterView = UIView()
        case .populated, .initial:
            hideDisplayedPlaceholderView()
            tableView.tableFooterView = UIView()
        case .empty:
            presentEmptyView(with: "No movies to show")
        case .error(let error):
            presentErrorView(with: error.description, errorHandler: { [weak self] in
                self?.viewModel?.refreshMovies()
            })
        }
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        title = viewModel?.filter.title
        viewModel?.viewState.bindAndFire({ [weak self] state in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.configureView(withState: state)
                strongSelf.reloadTableView()
            }
        })
        viewModel?.startLoading.bind({ [weak self] start in
            start ? self?.showLoader() : self?.hideLoader()
        })
        viewModel?.getMovies()
    }
    
}

// MARK: - UITableViewDelegate

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: SegueIdentifier.movieDetail.rawValue, sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !displayedCellsIndexPaths.contains(indexPath) {
            displayedCellsIndexPaths.insert(indexPath)
            TableViewCellAnimator.fadeAnimate(cell: cell)
        }
    }
}

// MARK: - UIViewControllerPreviewingDelegate

//extension MovieListViewController: UIViewControllerPreviewingDelegate {
//
//
//}

// MARK: - Segue Identifiers

extension MovieListViewController {
    
    enum SegueIdentifier: String {
        case movieDetail = "MovieDetailSegue"
    }
}
