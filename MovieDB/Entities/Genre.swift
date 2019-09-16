//
//  Genre.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import Foundation
import CoreData

final class Genre: NSManagedObject {
    
    @NSManaged fileprivate(set) var id: Int
    @NSManaged fileprivate(set) var name: String
    
    static func insert(into context: NSManagedObjectContext, id: Int, name: String) -> Genre {
        let genre: Genre = context.insertObject()
        genre.id = id
        genre.name = name
        return genre
    }
}


// MARK: - Decodable

extension Genre: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("Missing context or invalid context")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: Genre.entityName, in: context) else {
            fatalError("Unknown entity in context")
        }
        
        self.init(entity: entity, insertInto: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}


// MARK: - Managed

extension Genre: Managed {
    
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: true)]
    }
    
}
