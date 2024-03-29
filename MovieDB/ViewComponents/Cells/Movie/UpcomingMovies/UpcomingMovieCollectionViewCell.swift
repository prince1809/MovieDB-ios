//
//  UpcomingMovieCollectionViewCell.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

protocol UpcomingMovieCollectionViewCell {
    
    var posterImageView: UIImageView! { get set }
    var viewModel: UpcomingMovieCellViewModel? { get set }
    
}
