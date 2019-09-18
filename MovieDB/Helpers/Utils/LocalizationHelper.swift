//
//  LocalizationHelper.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/18.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation

enum Language: String {
    case english = "en"
    case japanese = "ja"
}

struct LocalizationHelper {
    
    static let defaultLanguage: Language = .english
    
    static func getCurrentLanguageCode() -> String {
        guard let languageCode = Locale.current.languageCode else {
            return defaultLanguage.rawValue
        }
        return Language.init(rawValue: languageCode)?.rawValue ?? defaultLanguage.rawValue
    }
}
