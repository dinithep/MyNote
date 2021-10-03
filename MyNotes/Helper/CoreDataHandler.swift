//
//  CoreDataHandler.swift
//  MyNotes
//
//  Created by Dinithe Asiri on 2021-10-03.
//

import Foundation
import CoreData

import CoreData
import Foundation

class CoreDataHandler {

    private init(){}

    static var context :NSManagedObjectContext {

        return persistentContainer.viewContext
    }

    static var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "MyNotes")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

   static func saveContext () {
        let context = self.context
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    static func deleteContext (object:NSManagedObject) {
        let context = self.context
        context.delete(object)

    }



}

