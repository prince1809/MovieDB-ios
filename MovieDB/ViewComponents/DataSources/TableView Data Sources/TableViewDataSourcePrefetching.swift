//
//  TableViewDataSourcePrefetching.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/02.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class TableViewDataSourcePrefetching: NSObject, UITableViewDataSourcePrefetching {
    
    private var cellCount: Int
    private let needsPrefetch: Bool
    private let prefetchHandler: (() -> Void)
    
    init(cellCount: Int, needsPrefetch: Bool, prefetchHandler: @escaping (() -> Void)) {
        self.cellCount = cellCount
        self.needsPrefetch = needsPrefetch
        self.prefetchHandler = prefetchHandler
    }
    
    func updateCellCount(_ cellCount: Int) {
        self.cellCount = cellCount
    }
    
    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= cellCount - 1
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard needsPrefetch else {
            return
        }
        if indexPaths.contains(where: isLoadingCell) {
            prefetchHandler()
        }
    }
    
    
}
