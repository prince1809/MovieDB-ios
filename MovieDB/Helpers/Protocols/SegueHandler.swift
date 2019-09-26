//
//  SegueHandler.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/27.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

protocol SegueHandler {
    
    associatedtype SegueIdentifier: RawRepresentable
    
}

extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier,
        let segueIdentifier = SegueIdentifier(rawValue: identifier)
            else { fatalError("Unknown segue: \(segue)") }
        return segueIdentifier
    }
    
    func performSegue(withIdentifier segueIdentifier: SegueIdentifier) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil)
    }
}
