//
//  RadarView.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class RadarView: UIView {
    
    // MARK: - Properties
    
    struct Colors {
        static let start = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        static let end = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    private let circleLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Setup
    private func setupUI() {
        backgroundColor = Colors.start
        layer.addSublayer(circleLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(startLoading),
                                               name: UIApplication.willEnterForegroundNotification, object: nil)
        startLoading()
    }
    
    @objc func startLoading() {
        
    }
}
