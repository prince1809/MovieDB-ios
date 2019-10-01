//
//  SimpleTableViewDataSource.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/02.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class SimpleTableViewDataSource<ViewModel>: NSObject, UITableViewDataSource {
    
    private let reuseIdentifier: String
    private var cellViewModels: [ViewModel]
    
    // MARK: - Initializers
    
    init(cellViewModels: [ViewModel], reuseIdentifier: String) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    
}
