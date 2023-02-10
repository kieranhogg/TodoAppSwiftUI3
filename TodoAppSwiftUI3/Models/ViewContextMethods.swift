//
//  ViewContextMethods.swift
//  TodoAppSwiftUI3
//
//  Created by Roman Luzgin on 22.06.21.
//

import Foundation
import CoreData
import SwiftUI

struct ViewContextMethods {
    enum RepeatUnit {
        case hours
        case days
        case weeks
        case months
        case years
    }
    static func addItem(
        context: NSManagedObjectContext,
        dueDate: Date?,
        toDoText: String,
        category: String,
        spotlighted: Bool,
        waiting: Bool,
        repeatUnit: RepeatUnit?,
        repeatPeriod: Int?,
        repeatEnd: Date? = nil,
        details: String?,
        workingOn: Bool,
        deleted: Bool,
        checklist: Int?
    ) {
        withAnimation {
            let newItem = Item(context: context)
            newItem.timestamp = Date()
            newItem.dueDate = dueDate
            newItem.toDoText = toDoText
            newItem.isDone = false
            newItem.category = category
            newItem.spotlighted = false
            newItem.waiting = false
            newItem.repeatUnit = nil
            newItem.repeatPeriod = nil
            newItem.repeatEnd = nil
            newItem.details = nil
            newItem.workingOn = false
            newItem.deleted = false
            newItem.checklist = nil
            
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    static func isDone(item: Item, context: NSManagedObjectContext) {
        withAnimation{
            item.isDone.toggle()
        }
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
}
