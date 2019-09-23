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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        setupButtons()
    }
    
    private func setupButtons() {
        signInButton.layer.cornerRadius = 25
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
