//
//  APIError.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

enum APIError: Error, ErrorDescriptable {
    case notAuthenticated
    case notFound
    case networkProblem
    case badRequest
    case requestFailed
    case invalidData
    case unknown(HTTPURLResponse?)
    
    init(response: URLResponse?) {
        guard let response = response as? HTTPURLResponse else {
            self = .unknown(nil)
            return
        }
        switch response.statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .notAuthenticated
        case 404:
            self = .notFound
        default:
            self = .unknown(response)
        }
    }
    
    var isAuthError: Bool {
        switch self {
        case .notAuthenticated: return true
        default: return false
        }
    }
    
    var description: String {
        switch self {
        case .notAuthenticated:
            return ErrorMessages.Default.NotAuthorized
        case .notFound:
            return ErrorMessages.Default.NotFound
        case .networkProblem, .unknown:
            return ErrorMessages.Default.ServerError
        case .requestFailed, .badRequest, .invalidData:
            return ErrorMessages.Default.RequestFailed
        }
    }
}


// MARK: - Constants

extension APIError {
    
    struct ErrorMessages {
        
        struct Default {
            static let ServerError = "Server Error. Please, try again later."
            static let NotAuthorized = "This information is not available."
            static let NotFound = "Bad request error."
            static let RequestFailed = "Request failed. Please, try again later."
        }
    }
}
