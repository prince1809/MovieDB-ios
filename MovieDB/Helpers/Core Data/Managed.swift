//
//  Managed.swift
//  MovieDB
//
//  Created by Prince Kumar on 2019/09/16.
//  Copyright © 2019 Prince Kumar. All rights reserved.
//

import CoreData

protocol Managed: class, NSFetchRequestResult {
    
    static var entityName: String { get }
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
    
}

extension Managed {
    
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }
    
    static var sortedFetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        return request
    }
    
}

extension Managed where Self: NSManagedObject {
    
    static var entityName: String {
        return entity().name!
    }
    
    static func fetch(in context: NSManagedObjectContext,
                      with sortDescriptors: [NSSortDescriptor] = defaultSortDescriptors,
                      configurationBlock: (NSFetchRequest<Self>) -> Void = { _ in }) -> [Self] {
        let request = NSFetchRequest<Self>(entityName: self.entityName)
        request.sortDescriptors = sortDescriptors
        configurationBlock(request)
        return (try? context.fetch(request)) ?? []
    }
}
