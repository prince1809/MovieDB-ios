//
//  Dequeuable.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

protocol Dequeuable {
    
    static var dequeuIdentifier: String { get }
    
}


extension Dequeuable where Self: UIView {
    
    static var dequeuIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Dequeuable { }

extension UICollectionViewCell: Dequeuable { }
