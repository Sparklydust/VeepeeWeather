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
    cod: String = "200",
    message: Int = .zero,
    cnt: Int = 40,
    list: [ListData] = [.fake()],
    city: CityData = .fake()
  ) -> ForecastData {

    return ForecastData(
      cod: cod,
      message: message,
      cnt: cnt,
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
    name: String = "London",
    coord: CoordData = .fake(),
    country: String = "GB",
    population: Int = 1000000,
    timezone: Int = .zero,
    sunrise: Int = 1647324903,
    sunset: Int = 1647367441
  ) -> CityData {

    return CityData(
      id: id,
      name: name,
      coord: coord,
      country: country,
      population: population,
      timezone: timezone,
      sunrise: sunrise,
      sunset: sunset
    )
  }
}

// MARK: - CoordData
extension CoordData {
  /// Fake data for unit tests.
  static func fake(
    lat: Double = 51.5073,
    lon: Double = -0.1277
  ) -> CoordData {

    return CoordData(
      lat: lat,
      lon: lon
    )
  }
}

// MARK: - ListData
extension ListData {
  /// Fake data for unit tests.
  static func fake(
    dt: Int = 1647356400,
    main: MainClassData = .fake(),
    weather: [WeatherData] = [.fake()],
    clouds: CloudsData = .fake(),
    wind: WindData = .fake(),
    visibility: Int = 100000,
    pop: Double = .zero,
    sys: SysData = .fake(),
    dtTxt: String = "2022-05-22 18:00:00",
    rain: RainData? = .fake()
  ) -> ListData {

    return ListData(
      dt: dt,
      main: main,
      weather: weather,
      clouds: clouds,
      wind: wind,
      visibility: visibility,
      pop: pop,
      sys: sys,
      dtTxt: dtTxt,
      rain: rain
    )
  }
}

// MARK: - CloudsData
extension CloudsData {
  /// Fake data for unit tests.
  static func fake(
    all: Int = 42
  ) -> CloudsData {

    return CloudsData(
      all: all
    )
  }
}

// MARK: - MainClassData
extension MainClassData {
  /// Fake data for unit tests.
  static func fake(
    temp: Double = 23.3,
    feelsLike: Double = 26,
    tempMin: Double = 15,
    tempMax: Double = 30,
    pressure: Int = 1004,
    seaLevel: Int = 1004,
    grndLevel: Int = 998,
    humidity: Int = 86,
    tempKf: Double = .zero
  ) -> MainClassData {

    return MainClassData(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      seaLevel: seaLevel,
      grndLevel: grndLevel,
      humidity: humidity,
      tempKf: tempKf
    )
  }
}

// MARK: - RainData
extension RainData {
  /// Fake data for unit tests.
  static func fake(
    the3H: Double = 1.71
  ) -> RainData {

    return RainData(
      the3H: the3H
    )
  }
}

// MARK: - SysData
extension SysData {
  /// Fake data for unit tests.
  static func fake(
    pod: Pod = .n
  ) -> SysData {

    return SysData(
      pod: pod
    )
  }
}

// MARK: - WeatherData
extension WeatherData {
  /// Fake data for unit tests.
  static func fake(
    id: Int = 802,
    main: MainEnum = .clouds,
    weatherDescription: String = "scattered clouds",
    icon: String = "03n"
  ) -> WeatherData {

    return WeatherData(
      id: id,
      main: main,
      weatherDescription: weatherDescription,
      icon: icon
    )
  }
}

// MARK: - WindData
extension WindData {
  /// Fake data for unit tests.
  static func fake(
    speed: Double = 3.51,
    deg: Int = 274,
    gust: Double = 8.97
  ) -> WindData {

    return WindData(
      speed: speed,
      deg: deg,
      gust: gust
    )
  }
}
