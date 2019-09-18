//
//  Emptiable.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

private struct AssociatedKeys {
    static var emptyView: EmptyPlaceholderView = EmptyPlaceholderView()
}

protocol Emptiable: class { }

extension Emptiable where Self: UIViewController {
    
    private(set) var emptyView: EmptyPlaceholderView {
       
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.emptyView) as? EmptyPlaceholderView else {
                return EmptyPlaceholderView()
            }
            return value
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.emptyView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func presentEmptyView(with message: String?) {
        let isPresented = emptyView.isPresented
        if !isPresented {
            emptyView = EmptyPlaceholderView.show(fromViewController: self,
                                                  animated: true,
                                                  completion: nil)
        }
        emptyView.frame = self.view.bounds
        emptyView.messageText = message
    }
}
