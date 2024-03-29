//
//  MovieDetailOptionView.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/28.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

@IBDesignable
class MovieDetailOptionView: UIView {
    
    private lazy var optionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 3.0
        return stackView
    }()
    
    private lazy var optionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var optionTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        //label.font = FontHe
        label.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @IBInspectable var optionImage: UIImage? {
        didSet {
            optionImageView.image = optionImage
        }
    }
    
    @IBInspectable var localizedOptionTitle: String? {
        didSet {
            guard let title = localizedOptionTitle else { return }
            optionTitleLabel.text = NSLocalizedString(title, comment: "")
        }
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        setupStackView()
    }
    
    private func setupStackView() {
        addSubview(optionStackView)
        optionStackView.fillSuperview(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        
        optionStackView.addArrangedSubview(optionImageView)
        optionStackView.addArrangedSubview(optionTitleLabel)
    }
    
}
