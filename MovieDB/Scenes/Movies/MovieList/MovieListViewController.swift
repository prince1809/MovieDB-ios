//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/01.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, Loadable {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var displayedCellsIndexPaths = Set<IndexPath>()
    
    var loaderView: RadarView!
    
    var viewModel: MovieListViewModel? {
        didSet {
            setupBindables()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        title = viewModel?.filter.title
        viewModel?.viewState.bindAndFire({ [weak self] state in
            
        })
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

// MARK: - Segue Identifiers

extension MovieListViewController {
    
    enum SegueIdentifier: String {
        case movieDetail = "MovieDetailSegue"
    }
}
