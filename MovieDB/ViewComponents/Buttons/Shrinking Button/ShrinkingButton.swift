//
//  ShrinkingButton.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/15.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class ShrinkingButton: UIButton, UIViewControllerTransitioningDelegate, CAAnimationDelegate {
    
    var spinnerColor: UIColor = UIColor.white {
        didSet {
            //spiner.spinerColor = spiner
        }
    }
    
    private lazy var spiner: SpinerLayer = {
        let spiner = SpinerLayer(frame: self.frame)
        self.layer.addSublayer(spiner)
        return spiner
    }()
    
    private var cachedTitle: String?
    private var cachedImage: UIImage?
    
    private let shrinkCurve: CAMediaTimingFunction = CAMediaTimingFunction(name: .linear)
    private let shrinkDuration: CFTimeInterval = 0.1
    
    var isAnimating: Bool = false
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.setup
    }
    
    func startAnimation() {
        self.isAnimating = true
        
    }
    
}
