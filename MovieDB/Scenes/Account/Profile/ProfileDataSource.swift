//
//  ProfileDataSource.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/25.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

class ProfileDataSource: NSObject, UITableViewDataSource {
    
    private var viewModel: ProfileViewModel?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        return UITableViewCell()
    }
}
