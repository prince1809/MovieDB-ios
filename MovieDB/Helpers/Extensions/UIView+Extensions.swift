//
//  UIView+Extensions.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/29.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     * Frame of the view relative to the app window.
     */
    var absoluteFrame: CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
    
    /**
     * SHow a single shadow around the border of the view
     */
    func setShadowBorder(shadowColor: CGColor = UIColor.black.cgColor, shadowRadius: CGFloat = 5) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 0.5
    }
}
