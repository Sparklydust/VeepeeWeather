//
//  CoreDataService.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import CoreData
import SwiftUI

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

  private let persistentContainer: NSPersistentContainer

  lazy var managedContext: NSManagedObjectContext = {
    return self.persistentContainer.viewContext
  }()

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
      persistentContainer
        .persistentStoreDescriptions
        .first!
        .url = URL(fileURLWithPath: "/dev/null")
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
  func save(_ cityModel: CityModel) async {
    let cities = fetchCities()
    guard cities.isEmpty else {
      update(cities.first!, with: cityModel)
      return
    }
    await saving(cityModel)
  }

  /// Fetching the ``CityEntity`` data saved in ``CoreDataModel``.
  /// - Returns: An array of ``CityEntity`` saved in ``CoreData``.
  func fetchCities() -> [CityEntity] {
    let fetchRequest: NSFetchRequest<CityEntity> = CityEntity.fetchRequest()

    do { return try managedContext.fetch(fetchRequest) }
    catch {
      print(error.localizedDescription)
      return []
    }
  }

  /// Update the ``CityEntity`` forecast values.
  /// - Parameters:
  ///   - cityEntity: The city of Paris saved in ``CoreDataModel``.
  ///   - data: The data form api call used to update the entity.
  func update(
    _ cityEntity: CityEntity,
    with cityModel: CityModel
  ) {
    managedContext.performAndWait {


      saveContext()
    }
  }
}

// MARK: - Actions
extension CoreDataService {
  /// Save context in the CoreData sqlite database.
  private func saveContext() {
    guard managedContext.hasChanges else { return }
    do { try managedContext.save() }
    catch { print(error.localizedDescription) }
  }

  /// Saving a new `cityModel` in the CoreDataModel.
  /// - Parameter cityModel: The new city to save.
  private func saving(_ cityModel: CityModel) async {

    let cityEntity = CityEntity(context: managedContext)
    cityEntity.name = await cityModel.name

    let weatherEntities = await weatherEntities(with: cityModel)

    cityEntity.weathers = [weatherEntities]

    saveContext()
  }

  private func weatherEntities(
    with cityModel: CityModel
  ) async -> [WeatherEntity] {
    var weatherEntities = [WeatherEntity]()

    for weatherModel in await cityModel.weathers {

      let weatherEntity = WeatherEntity(context: managedContext)
      weatherEntity.type = weatherModel.type.rawValue
      weatherEntity.icon = weatherModel.icon
      weatherEntity.date = weatherModel.date
      weatherEntity.temp = weatherModel.temp
      weatherEntity.tempMin = weatherModel.tempMin
      weatherEntity.tempMax = weatherModel.tempMax
      weatherEntity.info = weatherModel.info

      weatherEntities.append(weatherEntity)
    }
    return weatherEntities
  }
}
