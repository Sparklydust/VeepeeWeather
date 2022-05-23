//
//  CityLocal.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 22/05/2022.
//

import CoreData
import SwiftUI

/// Local object representing the city that displays
/// the forecast on the ``WeatherView``.
/// - Info: Run on the ``MainActor``.
final actor CityLocal: ObservableObject {

  @Published @MainActor var name = String()
  @Published @MainActor var weathers = [WeatherLocal]()
}

// MARK: - Update
extension CityLocal {

  /// Update the ``CityLocal`` published values to be
  /// populate on the device.
  /// - Parameter cityEntity: The city save in the ``CoreDataModel``.
  @MainActor func update(with cityEntity: FetchedResults<CityEntity>) {
    guard cityEntity[.zero].name != nil else { return }
    name = cityEntity[.zero].name ?? String()
  }

  /// Update the ``CityLocal`` published values to be
  /// populate on the device.
  /// - Parameter forecastData: The city forecase fetched from
  /// api call that would define the ``CityLocal``.
  @MainActor func update(with forecastData: ForecastData) async {
    name = forecastData.city.name

    weathers.removeAll()
    for forecast in forecastData.list {
      let date = DateFormatter.createDate(with: forecast.dtTxt)
      keepOneDailyForecast(on: date)
      saveWeather(from: forecast, on: date)
    }
    weathers.sort { $0.date < $1.date }
  }

  /// Check for duplicated forecast in one day and delete it.
  /// - Parameter date: The date and time of the weather forecast.
  @MainActor private func keepOneDailyForecast(on date: Date) {
    for (index, weather) in weathers.enumerated()
    where Calendar.current.isDate(weather.date, inSameDayAs: date) {
      weathers.remove(at: index)
    }
  }

  /// Save the list of the next five days weather forecast
  /// in the weathers @Published property.
  /// - Parameters:
  ///   - forecast: The weather forecast fetched from api.
  ///   - date: The date and time of the weather forecast.
  @MainActor private func saveWeather(
    from forecast: ListData,
    on date: Date
  ) {
    let weatherLocal = WeatherLocal(
      type: forecast.weather[.zero].main,
      date: date,
      temp: forecast.main.temp,
      tempMin: forecast.main.tempMin,
      tempMax: forecast.main.tempMax,
      info: forecast.weather[.zero].weatherDescription
    )
    weathers.append(weatherLocal)
  }
}
