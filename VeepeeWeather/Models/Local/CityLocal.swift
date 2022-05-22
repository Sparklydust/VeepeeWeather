//
//  CityLocal.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 22/05/2022.
//

import Foundation

/// Local object representing the city that displays
/// the forecast on the ``WeatherView``.
/// - Info: Run on the ``MainActor``.
final actor CityLocal: ObservableObject {

  @Published @MainActor var id = Int.zero
  @Published @MainActor var name = String()
}

// MARK: - Update
extension CityLocal {

  /// Update the ``CityLocal`` published values to be
  /// populate on the device.
  /// - Parameter cityEntity: The city save in the ``CoreDataModel``.
  @MainActor func update(with cityEntity: CityEntity) {
    id = Int(cityEntity.id)
    name = cityEntity.name ?? "No Data"
  }

  /// Update the ``CityLocal`` published values to be
  /// populate on the device.
  /// - Parameter forecastData: The city forecase fetched from
  /// api call that would define the ``CityLocal``.
  @MainActor func update(with forecastData: ForecastData) {
    id = forecastData.city.id
    name = forecastData.city.name
  }
}
