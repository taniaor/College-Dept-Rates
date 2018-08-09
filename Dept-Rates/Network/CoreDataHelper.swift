//
//  CoreDataHelper.swift
//  Dept-Rates
//
//  Created by Tania Ortiz-Rosales on 8/2/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newSchool() -> CoreDataSchool {
        let school = NSEntityDescription.insertNewObject(forEntityName: "CoreDataSchool", into: context) as! CoreDataSchool
        
        return school
    }
    
    static func saveSchool() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(school: CoreDataSchool) {
        context.delete(school)
        saveSchool()
    }
    
    static func retrieveSchool() -> [CoreDataSchool] {
        do {
            let fetchRequest = NSFetchRequest<CoreDataSchool>(entityName: "CoreDataSchool")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
        
    }
}

