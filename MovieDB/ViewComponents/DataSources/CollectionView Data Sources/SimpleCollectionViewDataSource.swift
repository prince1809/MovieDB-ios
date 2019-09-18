//
//  SimpleCollectionViewDataSource.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class SimpleCollectionViewDataSource<ViewModel>: NSObject, UICollectionViewDataSource {
    
    typealias CellConfigurator = (ViewModel, UICollectionViewCell) -> Void
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    private var cellViewModels: [ViewModel]
    
    // MARK: Initializers
    
    init(cellViewModels: [ViewModel], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(viewModel, cell)
        return cell
    }
}

extension SimpleCollectionViewDataSource where ViewModel == UpcomingMovieCellViewModel {
    
    static func make(for cellViewModels: [UpcomingMovieCellViewModel],
                     presentationMode: UpcomingMoviesViewController.PresentationMode) -> SimpleCollectionViewDataSource {
        return SimpleCollectionViewDataSource(cellViewModels: cellViewModels,
                                              reuseIdentifier: presentationMode.cellIdentifier,
                                              cellConfigurator: { (viewModel, cell) in
                                                var cell = cell as! UpcomingMovieCollectionViewCell
                                                cell.viewModel = viewModel
        })
    }
    
}
