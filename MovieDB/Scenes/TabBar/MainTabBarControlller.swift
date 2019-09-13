//
//  MainTabBarControlller.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/14.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var currentSelectedItemIndex: Int!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
}
