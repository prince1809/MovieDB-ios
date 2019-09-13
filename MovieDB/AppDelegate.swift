//
//  AppDelegate.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/13.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var storyboard: UIStoryboard!
    
    //private var currentTabBarSelectedIndex: Main
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        guard let shortcut = AppShortcutItem(rawValue: shortcutItem.type) else { return }
        
//        switch shortcut {
//        case .searchMovies:
//           // currentTabBarSelectedIndex = .sea
//        }
    }
    
    
}

