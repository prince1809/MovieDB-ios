//
//  DefaultRefreshControl.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class DefaultRefreshControl: UIRefreshControl {
    
    var refreshHandler: () -> Void
    
    // MARK: - Initializers
    
    init(tintColor: UIColor = ColorPalette.lightBlueColor,
         attributedTitle: String = "",
         backgroundColor: UIColor? = .clear,
         refreshHandler: @escaping () -> Void) {
        self.refreshHandler = refreshHandler
        super.init()
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.attributedTitle = NSAttributedString(string: attributedTitle,
                                                  attributes: [NSAttributedString.Key.foregroundColor: tintColor])
        addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Selectors
    
    @objc func refreshControlAction() {
        refreshHandler()
    }
}
