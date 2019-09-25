//
//  ProfileTableViewController.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/25.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    
    func profileViewController(didTapCollection collection: ProfileCollectionOption)
    
    func profileViewController(didTapGroup group: ProfileGroupOption)
    
    func profileViewController(didTapSignOutButton tapped: Bool)
}

class ProfileTableViewController: UITableViewController {
    
    private var dataSource: ProfileDataSource!
    
}
