//
//  VerticalFlowLayout.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class VerticalFlowLayout: UICollectionViewFlowLayout {
    
    init(width: Double, height: Double, margin: CGFloat = 16.0) {
        super.init()
        itemSize = CGSize(width: width, height: height)
        sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
