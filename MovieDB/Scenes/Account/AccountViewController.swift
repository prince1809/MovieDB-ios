//
//  AccountViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/15.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    private lazy var signInViewController: SignInViewController = {
        var viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! SignInViewController
        viewController.delegate = self
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private var viewModel = AccountViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        print("view loaded")
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        setupContainerView()
    }
    
    private func setupContainerView() {
        showSignInView()
    }
    
    private func showSignInView(withAnimatedNavigationBar animated: Bool = false) {
        add(asChildViewController: signInViewController)
    }
}


// MARK: - SignInViewControllerDelegate

extension AccountViewController: SignInViewControllerDelegate {
    
    func signInViewController(_ signInViewController: SignInViewController, didTapSignInButton tapped: Bool) {
        signInViewController.startLoading()
        print("logging in....")
    }
}

extension AccountViewController {
    
    enum SegueIdentifier: String {
        case authPermission = "AuthPermissionSegue"
        case collectionList = "CollectionListSegue"
        case customLists = "CustomListsSegue"
    }
    
}


// MARK: - Constants

extension AccountViewController {
    
    struct Constants {
        
        static let Title = NSLocalizedString("accountTabBarTitle", comment: "")
        static let NavigationItemTitle = NSLocalizedString("accountTitle", comment: "")
        
    }
}

