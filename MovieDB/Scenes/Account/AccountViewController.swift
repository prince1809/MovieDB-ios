//
//  AccountViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/15.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, SegueHandler {
    
    private lazy var signInViewController: SignInViewController = {
        var viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! SignInViewController
        viewController.delegate = self
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var profileViewController: ProfileTableViewController = {
        var viewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileTableViewController") as! ProfileTableViewController
        viewController.delegate = self
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private var viewModel = AccountViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        title = Constants.Title
        setupContainerView()
        setupNavigationBar()
    }
    
    private func setupContainerView() {
        viewModel.isUserSignedIn() ? showSignInView() : showSignInView()
    }
    
    
    private func setupNavigationBar() {
        navigationItem.title = Constants.NavigationItemTitle
    }
    
    private func showSignInView(withAnimatedNavigationBar animated: Bool = false) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        //remove(asChildViewController: profileV)
        add(asChildViewController: signInViewController)
    }
    
    private func showProfileView(withAnimatedNavigationBar animated: Bool = false) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        remove(asChildViewController: signInViewController)
        // Rebuild the profile view model to show an up to date profile.
        //profileViewController.viewModel
    }
    
    private func didSignIn() {
        
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        
        viewModel.showAuthPermission = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.performSegue(withIdentifier: .authPermission)
        }
        
        viewModel.didSignIn = { [weak self] in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.didSignIn()
            }
        }
        
        viewModel.didReceiveError = { [weak self] in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.signInViewController.stopLoading()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .authPermission:
            guard let navController = segue.destination as? UINavigationController,
                let viewController = navController.topViewController as? AuthPermissionViewController else {
                    fatalError()
            }
            _ = viewController.view
            viewController.delegate = self
            viewController.viewModel = viewModel.buildAuthPermissionViewModel()
        default:
            print("")
        }
    }
}


// MARK: - SignInViewControllerDelegate

extension AccountViewController: SignInViewControllerDelegate {
    
    func signInViewController(_ signInViewController: SignInViewController, didTapSignInButton tapped: Bool) {
        signInViewController.startLoading()
        viewModel.getRequestToken()
    }
}

// MARK: - ProfileViewControllerDelegate

extension AccountViewController: ProfileViewControllerDelegate {
    
    func profileViewController(didTapCollection collection: ProfileCollectionOption) {
        
    }
    
    func profileViewController(didTapGroup group: ProfileGroupOption) {
        
    }
    
    func profileViewController(didTapSignOutButton tapped: Bool) {
        
    }
}

// MARK: - AuthPermissionViewControllerDelegate

extension AccountViewController: AuthPermissionViewControllerDelegate {
    
    func authPermissionViewController(_ authPermissionViewController: AuthPermissionViewController, didSignedIn signedIn: Bool) {
        print("sign in")
    }
}


// MARK: - Segue Identifiers

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

