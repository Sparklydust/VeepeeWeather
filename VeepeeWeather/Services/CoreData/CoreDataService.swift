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

  static private(set) var managedObjectModel: NSManagedObjectModel = {
    let bundle = Bundle(for: CoreDataService.self)
    guard let url = bundle.url(forResource: "CoreDataModel", withExtension: "momd"),
          let model = NSManagedObjectModel(contentsOf: url)
    else { fatalError() }
    return model
  }()

  let persistentContainer: NSPersistentContainer

  /// Setup CoreData persistent store to save data on disk.
  /// - Parameter inMemory: Set to false for the app to use the
  /// persisted storage for production or the `inMemory` for unit tests.
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

// MARK: - Sqlite Requests
extension CoreDataService {
  /// Saving the forecast data in the persistent store to a ``CityEntity``.
  /// - Parameter data: Forecast data for the Paris city fetch from api.
  func save(city data: ForecastData) {
    let cities = fetchCities()
    guard cities.isEmpty else {
      update(cities.first!, with: data)
      return
    }

    let cityEntity = CityEntity(
      context: persistentContainer.viewContext)

    cityEntity.id = Int32(data.city.id)
    cityEntity.name = data.city.name

    saveInCoreData()
  }

  /// Fetching the ``CityEntity`` data saved in ``CoreDataModel``.
  /// - Returns: An array of ``CityEntity`` saved in ``CoreData``.
  func fetchCities() -> [CityEntity] {
    let fetchRequest: NSFetchRequest<CityEntity> = CityEntity.fetchRequest()
    let context = persistentContainer.viewContext

    do { return try context.fetch(fetchRequest) }
    catch {
      rollbackChanges(on: error, in: context)
      return []
    }
  }

  /// Update the ``CityEntity`` forecast values.
  /// - Parameters:
  ///   - cityEntity: The city of Paris saved in ``CoreDataModel``.
  ///   - data: The data form api call used to update the entity.
  func update(
    _ cityEntity: CityEntity,
    with data: ForecastData
  ) {
    persistentContainer.viewContext.performAndWait {

      saveInCoreData()
    }
  }
}

// MARK: - Actions
extension CoreDataService {
  /// Save context in the CoreData sqlite database.
  private func saveInCoreData() {
    let context = persistentContainer.viewContext
    do {
      try context.save()
      context.reset()
    }
    catch { rollbackChanges(on: error, in: context) }
  }

  // Rollback is being made when context has changes to clear.
  private func rollbackChanges(
    on error: Error,
    in context: NSManagedObjectContext
  ) {
    print(error.localizedDescription)
    if context.hasChanges {
      context.rollback()
    }
  }
}
