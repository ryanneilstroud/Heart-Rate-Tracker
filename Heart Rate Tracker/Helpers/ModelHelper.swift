//
//  ModelHelper.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 11/8/2021.
//

import Foundation
import CoreData

class ModelHelper {
    
    lazy var persistentContainer: NSPersistentContainer = {
      // 2
      let container = NSPersistentContainer(name: "HRT")
      // 3
      container.loadPersistentStores { _, error in
        // 4
        if let error = error as NSError? {
          // You should add your own error handling code here.
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      }
      return container
    }()
    
    var heartratesIsEmpty: Bool {
        return getHeartrates().heartrates.isEmpty
    }
    
    func postHeartrate(_ heartrate: Int, date: Date = Date()) -> AppError? {
        let context = persistentContainer.viewContext

        let bpm = Heartrate(context: context)
        bpm.heartrate = Int16(heartrate)
        bpm.date      = date
        
        do {
            try context.save()
        } catch {
            return .contextSaveFail
        }
        
        return nil
    }
    
    func getHeartrates() -> (heartrates: [Heartrate], error: AppError?) {
        let context = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Heartrate")
        do {
            let data = try context.fetch(request).compactMap { $0 as? Heartrate }
            return (data, nil)
        } catch {
            return ([], .contextFetchFail)
        }
    }
}
