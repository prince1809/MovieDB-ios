//
//  UpcomingMoviesNavigationManager.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class UpcomingMoviesNavigationManager: NSObject, UINavigationControllerDelegate {
    
    private var verticalSafeAreaOffset: CGFloat
    private var selectedFrame: CGRect?
    private var imageToTransition: UIImage?
    
    // MARK: - Initializers
    
    init(verticalSafeAreaOffset: CGFloat) {
        self.verticalSafeAreaOffset = verticalSafeAreaOffset
    }
    
    
    // MARK: - Public
    
    func configure(selectedFrame: CGRect?, with imageToTransition: UIImage?) {
        self.selectedFrame = selectedFrame
        self.imageToTransition = imageToTransition
    }
    
    func updateOffset(_ verticalSafeAreaOffset: CGFloat) {
        self.verticalSafeAreaOffset = verticalSafeAreaOffset
    }
}
