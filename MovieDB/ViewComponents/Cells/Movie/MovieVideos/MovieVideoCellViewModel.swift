//
//  MovieVideoCellViewModel.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/10/03.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

final class MovieVideoCellViewModel {
    
    let name: String
    let key: String
    let thumbnailURL: URL?
    
    init(_ video: Video) {
        name = video.name
        key = video.key
        thumbnailURL = video.thumbnailURL
    }
    
}
