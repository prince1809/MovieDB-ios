//
//  TableViewCellAnimator.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/02.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class TableViewCellAnimator {
    
    class func fadeAnimate(cell: UITableViewCell) {
        let view = cell.contentView
        view.layer.opacity = 0.1
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: .allowUserInteraction, animations: {
            view.layer.opacity = 1
        }, completion: nil)
    }
    
}
