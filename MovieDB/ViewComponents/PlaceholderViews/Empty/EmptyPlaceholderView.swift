//
//  EmptyPlaceholderView.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class EmptyPlaceholderView: UIView, NibLoadable {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    private var animationDuration = 0.3
    var isPresented: Bool = false
    
    var messageText: String? {
        didSet {
            guard let messageText = messageText else { return }
            messageLabel.text = messageText
        }
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        imageView.image = #imageLiteral(resourceName: "EmptyPlaceholder")
        messageLabel.textColor = ColorPalette.lightBlueColor
    }
    
    private func show(animated: Bool = true, completion: ((Bool) -> Swift.Void)? = nil) {
        self.superview?.bringSubviewToFront(self)
        if animated {
            UIView.animate(withDuration: self.animationDuration, animations: { self.alpha = 1 }, completion: completion)
        } else {
            self.alpha = 1
            completion?(true)
        }
    }
}

// MARK: - EMptyDisplayable

extension EmptyPlaceholderView {
    static func show<T: EmptyPlaceholderView>(
        fromViewController viewController: UIViewController,
        animated: Bool = true,
        completion: ((Bool) -> Swift.Void)? = nil) -> T {
        
        guard let subview = loadFromNib() as? T else {
            fatalError("The subview is exptected to be of type \(T.self)")
        }
        
        viewController.view.addSubview(subview)
        
        // Configure constraints if needed
        
        subview.alpha = 0
        subview.isPresented = true
        subview.superview?.sendSubviewToBack(subview)
        subview.show(animated: animated) { _ in
        }
        return subview
    }
    
}
