//
//  UIViewwController+Extensions.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/14.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var appDelegate: AppDelegate? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return delegate
    }
    
    func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        
        view.addSubview(viewController.view)
        
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
}
