//
//  Retryable.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

private struct AssociatedKeys {
    static var errorView: ErrorPlaceholderView = ErrorPlaceholderView()
}

protocol Retryable: class { }

extension Retryable where Self: UIViewController {
    
    private(set) var errorView: ErrorPlaceholderView {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.errorView) as? ErrorPlaceholderView else {
                return ErrorPlaceholderView()
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.errorView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func presentErrorView(with errorMessage: String?, errorHandler: @escaping () -> Void) {
        let isPresented = errorView.isPresented
        if isPresented {
            //errorView.stopAnimation()
        }
    }
    
}
