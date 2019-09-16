//
//  ViewState.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

enum SimpleViewState<Entity>: Equatable where Entity: Equatable {
    
    case initial
    case paging([Entity], next: Int)
    case populated([Entity])
    case empty
    case error(ErrorDescriptable)
    
    
    static func == (lhs: SimpleViewState, rhs: SimpleViewState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        default:
            return false
        }
    }
    
    var currentEntities: [Entity] {
        switch self {
        case .populated(let entities):
            return entities
        case .paging(let entities, _):
            return entities
        case .initial, .empty, .error:
            return []
        }
    }
}
