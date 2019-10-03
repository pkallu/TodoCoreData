//
//  Todo+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Pragathi Kallu on 10/3/19.
//  Copyright © 2019 Pragathi Kallu. All rights reserved.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var createdOn: Date?
    @NSManaged public var todo: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var status: Int16

}
