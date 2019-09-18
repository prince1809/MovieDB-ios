//
//  UICollectionView+Extensions.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func isScrolledToTop() -> Bool {
        return contentOffset == .zero
    }
    
    func scrollToTop(animated: Bool) {
        setContentOffset(.zero, animated: animated)
    }
    
    
    // MARK: - Cell Register
    
    // MARK: - Nib Register
    
    func registerNib<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeuIdentifier
        let nib = UINib(nibName: identifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}
