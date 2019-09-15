//
//  SignInViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/15.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

protocol SignInViewControllerDelegate: class {
    
    func signInViewController(_ signInViewController: SignInViewController, didTapSignInButton tapped: Bool)
    
}

class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInButton: ShrinkingButton!
    
    weak var delegate: SignInViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public
    func startLoading() {
        //signInButton.start
    }

    // MARK: - Actions
    
    @IBAction func loginButtonAction(_ sender: Any) {
        delegate?.signInViewController(self, didTapSignInButton: true)
    }
}
