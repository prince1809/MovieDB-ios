//
//  UIRefreshControl+Extensions.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

extension UIRefreshControl {
    
    func endRefreshing(with delay: TimeInterval = 0.5) {
        if isRefreshing {
            perform(#selector(UIRefreshControl.endRefreshing), with: nil, afterDelay: delay)
        }
    }
}
