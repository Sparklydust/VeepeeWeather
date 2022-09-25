//
//  CityModel.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 22/05/2022.
//

import CoreData
import SwiftUI

/// Local object representing the city that displays
/// the forecast on the ``WeatherView``.
/// - Info: Run on the ``MainActor``.
final actor CityModel: ObservableObject {

  @Published @MainActor var name = String()
  @Published @MainActor var weathers = [WeatherModel]()
  @Published @MainActor var selectedWeather: WeatherModel?
}

// MARK: - Update
extension CityModel {

  /// Update the ``CityModel`` published values to be
  /// populate on the device.
  /// - Parameter cityEntity: The city save in the ``CoreDataModel``.
  @MainActor func update(with cityEntity: CityEntity) {

    name = cityEntity.name ?? "No Data"
    weathers.removeAll()

    for weatherEntity in cityEntity.weathers ?? [] {
      let weather = WeatherModel(with: weatherEntity as! WeatherEntity)
      weathers.append(weather)
    }
  }

  /// Update the ``CityModel`` published values to be
  /// populate on the device.
  /// - Parameter forecastData: The city forecast fetched from
  /// api call that would define the ``CityModel``.
  @MainActor func update(with forecastData: ForecastData) async {
    name = forecastData.city.name

    weathers.removeAll()
    for forecast in forecastData.list {
      guard weathers.count < 5 else { return }
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
    let weatherModel = WeatherModel(
      id: UUID(),
      type: forecast.weather[.zero].main,
      icon: forecast.weather[.zero].icon,
      date: date,
      temp: forecast.main.temp,
      tempMin: forecast.main.tempMin,
      tempMax: forecast.main.tempMax,
      info: forecast.weather[.zero].description
    )
    weathers.append(weatherModel)
  }
}
