//
//  Todo+CoreDataClass.swift
//  CoreDataSample
//
//  Created by Pragathi Kallu on 10/3/19.
//  Copyright © 2019 Pragathi Kallu. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

enum Status: Int {
    case todo, inProgress, done
}

@objc(Todo)
public class Todo: NSManagedObject {
    
    private class func getAppDelegate() -> AppDelegate {
        return  UIApplication.shared.delegate as! AppDelegate
    }
    
   private class func newTodo() -> Todo {
        let managedContext = getAppDelegate().persistentContainer.viewContext
        return Todo(context: managedContext)
    }
    
   class func getTodos() -> [Todo] {

    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
    do {
        let results = try getAppDelegate().persistentContainer.viewContext.fetch(request)
        return results as! [Todo]
    } catch {
        return [Todo]()
    }
}
    
    class func createTodo(todoText: String)  {
        let todo = newTodo()
        todo.todo = todoText
        todo.dueDate = Date()
        todo.createdOn = Date()
        todo.status = Int16(Status.todo.rawValue)
        getAppDelegate().saveContext()
    }
    
}
