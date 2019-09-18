//
//  Loadable.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

private struct AssociatedKeys {
    static var isPresented: Bool = false
}

protocol Loadable: class {
    
    associatedtype ViewType: UIView
    
    var loaderView: ViewType! { get set }
}


extension Loadable where Self: UIViewController {
    
    private(set) var isPresented: Bool {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.isPresented) as? Bool else {
                return false
            }
            return value
        }
        set(newValue) {
             objc_setAssociatedObject(self, &AssociatedKeys.isPresented, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: Fullscreen loader
    
    func showLoader(with backgroundColor: UIColor = .white) {
        guard !isPresented else {
            return
        }
        isPresented = true
        DispatchQueue.main.async {
            //let containerView.back
        }
    }
    
    // MARK: - Hiding loader
    func hideLoader() {
        
    }
}
