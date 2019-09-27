//
//  AuthPermissionViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/27.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit
import WebKit

protocol AuthPermissionViewControllerDelegate: class {
    
    func authPermissionViewController(_ authPermissionViewController: AuthPermissionViewController, didSignedIn signedIn: Bool)
    
}

class AuthPermissionViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    weak var delegate: AuthPermissionViewControllerDelegate?
    
    var viewModel: AuthPermissionViewModel? {
        didSet {
            setupBindables()
        }
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        setupNavigationBar()
        setupWebView()
    }
    
    private func setupNavigationBar() {
        let closeBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop,
                                                 target: self,
                                                 action: #selector(closeBarButtonAction))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    private func setupWebView() {
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        loadURL()
    }
    
    private func loadURL() {
        guard let url = viewModel?.authPermissionURL else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    // MARK: - Selectors
    
    @objc func closeBarButtonAction() {
        dismiss(animated: true, completion: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.authPermissionViewController(strongSelf, didSignedIn: true)
        })
    }
    
    // MARK: - Actions

    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @IBAction func reloadButtonPressed(_ sender: UIBarButtonItem) {
        loadURL()
    }
    
}

// MARK: - WKNavigationDelegate

extension AuthPermissionViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let response = navigationResponse.response as? HTTPURLResponse,
            let headers = response.allHeaderFields as? [String: Any],
            let callback = headers["authentication-callback"] as? String {
            print(callback)
            dismiss(animated: true, completion: {
                self.delegate?.authPermissionViewController(self, didSignedIn: true)
            })
        }
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.backButton.isEnabled = webView.canGoBack
        self.forwardButton.isEnabled = webView.canGoForward
    }
}
