//
//  WeatherFixtures.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 19/09/2022.
//

import Foundation

// MARK: - WeatherModel
extension WeatherModel {

  /// Fake data for SwiftUI previews.
  static func fixture(
    id: UUID = UUID(),
    type: MainEnum = .clear,
    icon: String = "www.fake-icon.com",
    date: Date = Date(),
    temp: Double = 35.4,
    tempMin: Double = 24,
    tempMax: Double = 38.9,
    info: String = "Clear sky with a fresh breeze"
  ) -> WeatherModel {

    return WeatherModel(
      id: id,
      type: type,
      icon: icon,
      date: date,
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax,
      info: info
    )
  }
}
