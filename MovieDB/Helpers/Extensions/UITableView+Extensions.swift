//
//  UITableView+Extensions.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/27.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

extension UITableView {
    
    func isScrolledToTop() -> Bool {
        return contentOffset == .zero
    }
    
    func scrollToTop(animated: Bool) {
        setContentOffset(.zero, animated: animated)
    }
    
    // MARK: - Cell Register
    
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeuIdentifier
        register(cellType, forCellReuseIdentifier: identifier)
    }
    
    // MARK: - Nib Register
    
    func registerNib<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeuIdentifier
        let nib = UINib(nibName: identifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: identifier)
    }
    
    // MARK: - Dequeing
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.dequeuIdentifier, for: indexPath) as! T
    }
    
    // MARK: - Header
    
    func configureDynamicHeaderViewHeight() {
        guard let headerView = tableHeaderView else { return }
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var headerFrame = headerView.frame
        
        // Comparison needed to avoid infinite loop
        if height != headerFrame.size.height {
            headerFrame.size.height = height
            headerView.frame = headerFrame
            tableHeaderView = headerView
        }
    }
    
    
}
