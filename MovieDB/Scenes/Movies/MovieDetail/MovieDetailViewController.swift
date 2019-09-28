//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/28.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, SegueHandler {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


// MARK: - Segue Identifiers

extension MovieDetailViewController {
    
    enum SegueIdentifier: String {
        case movieVideos = "MovieVideosSegue"
        case movieReviews = "MovieReviewSegue"
    }
}
