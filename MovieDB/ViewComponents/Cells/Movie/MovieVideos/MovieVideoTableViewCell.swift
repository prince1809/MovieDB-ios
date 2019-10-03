//
//  MovieVideoTableViewCell.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/03.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class MovieVideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    
    
    var viewModel: MovieVideoCellViewModel? {
        didSet {
            setupBindables()
        }
    }
    
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        previewImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        nameLabel.font = FontHelper.light(withSize: 16.0)
        nameLabel.textColor = ColorPalette.Label.defaultColor
    }

    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.name
        previewImageView.kf.indicatorType = .activity
        previewImageView.kf.setImage(with: viewModel.thumbnailURL)
    }
    
}
