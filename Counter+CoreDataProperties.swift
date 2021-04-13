//
//  Counter+CoreDataProperties.swift
//  counter
//
//  Created by Carlos Cardona on 13/04/21.
//
//

import Foundation
import CoreData


extension Counter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Counter> {
        return NSFetchRequest<Counter>(entityName: "Counter")
    }

    @NSManaged public var counter: Int64

}

extension Counter : Identifiable {

}
