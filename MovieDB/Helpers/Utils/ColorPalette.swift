//
//  ColorPalette.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(withIntRed red: Int, green: Int, blue: Int, alpha: CGFloat) {
        
        let floatRed = CGFloat(red)/255
        let floatGreen = CGFloat(green)/255
        let floatBlue = CGFloat(blue)/255
        
        self.init(red: floatRed, green: floatGreen, blue: floatBlue, alpha: alpha)
    }
}

struct ColorPalette {
    
    static let lightBlueColor = UIColor(withIntRed: 74, green: 144, blue: 226, alpha: 1)
    static let darkBlueColor = UIColor(withIntRed: 0, green: 101, blue: 163, alpha: 1)
    static let lightGrayColor = UIColor(withIntRed: 205, green: 205, blue: 205, alpha: 1)
    static let redColor = UIColor(withIntRed: 255, green: 94, blue: 112, alpha: 1)
    
    static let whiteColor = UIColor(white: 249 / 255, alpha: 1)
    static let grayColor = UIColor(withIntRed: 130, green: 130, blue: 130, alpha: 1)
    static let blackColor = UIColor(white: 40 / 255, alpha: 1)
    
    static let darkGray = UIColor.darkGray
    static let lightGray = UIColor.lightGray
    static let lighterGray = UIColor(withIntRed: 223, green: 223, blue: 223, alpha: 1)
    
    struct Label {
        static let defaultColor = UIColor.darkGray
    }
    
}
