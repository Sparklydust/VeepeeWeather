//
//  CoreDataService.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import CoreData

/// Responsible for operating CoreData actions between its
/// persistent store and the Weather ServerSide.
final class CoreDataService: ObservableObject {

  static var managedObjectModel: NSManagedObjectModel = {
    let bundle = Bundle(for: CoreDataService.self)
    guard let url = bundle.url(forResource: "CoreDataModel", withExtension: "momd"),
          let model = NSManagedObjectModel(contentsOf: url)
    else { fatalError() }
    return model
  }()

  let persistentContainer: NSPersistentContainer

  /// Setup CoreData persistent store to save data on disk.
  /// - Parameter inMemory: Set to false the app use thepersisted
  /// storage for production or the `inMemory` for unit tests.
  init(inMemory: Bool = false) {
    persistentContainer = NSPersistentContainer(
      name: "CoreDataModel",
      managedObjectModel: Self.managedObjectModel
    )

    // Force unwrapping to make sure path on disk is setup properly.
    if inMemory {
      persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }

    persistentContainer.loadPersistentStores { _, error in
      if let error = error {
        // Check for fatal error as container must be persisted and loaded.
        fatalError(error.localizedDescription)
      }
    }
  }
}
