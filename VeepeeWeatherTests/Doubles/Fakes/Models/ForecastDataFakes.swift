//
//  ForecastDataFakes.swift
//  VeepeeWeatherTests
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation
@testable import VeepeeWeather

// MARK: - ForecastData
extension ForecastData {
  /// Fake data for unit tests.
  static func fake(
    list: [ListData] = [.fake()],
    city: CityData = .fake()
  ) -> ForecastData {

    return ForecastData(
      list: list,
      city: city
    )
  }
}

// MARK: - CityData
extension CityData {
  /// Fake data for unit tests.
  static func fake(
    id: Int = 2643743,
    name: String = "Paris"
  ) -> CityData {

    return CityData(
      id: id,
      name: name
    )
  }
}

// MARK: - ListData
extension ListData {
  /// Fake data for unit tests.
  static func fake(
    main: MainClassData = .fake(),
    weather: [WeatherData] = [.fake()],
    dtTxt: String = "2022-05-22 18:00:00"
  ) -> ListData {

    return ListData(
      main: main,
      weather: weather,
      dtTxt: dtTxt
    )
  }
}

// MARK: - MainClassData
extension MainClassData {
  /// Fake data for unit tests.
  static func fake(
    temp: Double = 23.3,
    tempMin: Double = 15,
    tempMax: Double = 30
  ) -> MainClassData {

    return MainClassData(
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax
    )
  }
}

// MARK: - WeatherData
extension WeatherData {
  /// Fake data for unit tests.
  static func fake(
    id: Int = 802,
    main: MainEnum = .clouds,
    description: String = "scattered clouds",
    icon: String = "03n"
  ) -> WeatherData {

    return WeatherData(
      id: id,
      main: main,
      description: description,
      icon: icon
    )
  }
}
