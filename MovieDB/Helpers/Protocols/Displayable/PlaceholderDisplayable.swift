//
//  PlaceholderDisplayable.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

protocol PlaceholderDisplayable: Retryable, Emptiable { }

extension PlaceholderDisplayable where Self: UIViewController {
    
    func hideDisplayedPlaceholderView() {
        
    }
}
