//
//  ViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/13.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    private var viewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindables()
    }
    
    // MARK: Reactive Behavior
    
    private func setupBindables() {
        appDelegate?.initialTransition()
//        viewModel.genresFetched = {[weak self] in
//            self?.appDelegate?.initialTransition()
//        }
    }
}

