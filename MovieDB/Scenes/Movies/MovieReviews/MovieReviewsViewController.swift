//
//  MovieReviewsViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/30.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class MovieReviewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var vieModel: MovieReviewsViewModel? {
        didSet {
            setupBindables()
        }
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        title = vieModel?.movieTitle
        //vieModel?.
    }
}
