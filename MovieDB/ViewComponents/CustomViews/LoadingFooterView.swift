//
//  LoadingFooterView.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/03.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class LoadingFooterView: UIView {
    
    static let recommendedFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
    
    fileprivate lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .darkGray
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: LoadingFooterView.recommendedFrame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        setupActivityIndicatorView()
    }
    
    private func setupActivityIndicatorView() {
        addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
    }
    
    // MARK: - Public
    
    func startAnimating() {
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }
}
