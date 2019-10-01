//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/01.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieContainerView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageView: VoteAverageView!
    
    
    var viewModel: MovieCellViewModel? {
        didSet {
            setupBindables()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        
    }
    
    // MARK: -  Reactive Behaviour
    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.name
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
        posterImageView.kf.indicatorType = .activity
        posterImageView.kf.setImage(with: viewModel.posterURL)
        voteAverageView.voteValue = viewModel.voteAverage
    }
    
}
