//
//  WeatherFixtures.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 19/09/2022.
//

import Foundation

// MARK: - WeatherLocal
extension WeatherLocal {

  /// Fake data for SwiftUI previews.
  static func fixtures(
    id: UUID = UUID(),
    type: MainEnum = .clear,
    date: Date = Date(),
    temp: Double = 35.4,
    tempMin: Double = 24,
    tempMax: Double = 38.9,
    info: String = "Clear sky with a fresh breeze"
  ) -> WeatherLocal {

    return WeatherLocal(
      id: id,
      type: type,
      date: date,
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax,
      info: info
    )
  }
}
