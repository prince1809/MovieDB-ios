//
//  SimpleTableViewDataSource.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/02.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class SimpleTableViewDataSource<ViewModel>: NSObject, UITableViewDataSource {
    
    typealias CellConfigurator = (ViewModel, UITableViewCell) -> Void
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    private var cellViewModels: [ViewModel]
    
    // MARK: - Initializers
    
    init(cellViewModels: [ViewModel], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(viewModel, cell)
        return cell
    }
    
    
}

extension SimpleTableViewDataSource where ViewModel == MovieCellViewModel {
    
    static func make(for cellViewModels: [ViewModel],
                     reuseIdentifier: String = MovieTableViewCell.dequeuIdentifier) -> SimpleTableViewDataSource {
        return SimpleTableViewDataSource(cellViewModels: cellViewModels, reuseIdentifier: reuseIdentifier,
                                         cellConfigurator: { (viewModel, cell) in
                                            let cell = cell as! MovieTableViewCell
                                            cell.viewModel = viewModel
        })
    }
}

extension SimpleTableViewDataSource where ViewModel == MovieVideoCellViewModel {
    
    static func make(for cellViewModels: [ViewModel],
                     reuseIdentifier: String = MovieVideoTableViewCell.dequeuIdentifier) -> SimpleTableViewDataSource {
        return SimpleTableViewDataSource(cellViewModels: cellViewModels,
                                         reuseIdentifier: reuseIdentifier,
                                         cellConfigurator: { (viewModel, cell) in
                                            let cell = cell as! MovieVideoTableViewCell
                                            cell.viewModel = viewModel
        })
    }
    
}
