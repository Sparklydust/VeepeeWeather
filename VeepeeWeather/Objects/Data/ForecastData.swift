//
//  ForecastData.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation

// MARK: - ForecastData
/// Data fetched from the https://openweathermap.org/forecast5 website.
///
/// It represents five days / tree hours of forecast.
struct ForecastData: Codable, Equatable {
  let list: [ListData]
  let city: CityData
}

// MARK: - CityData
struct CityData: Codable, Equatable {
  let id: Int
  let name: String
}

// MARK: - ListData
struct ListData: Codable, Equatable {
  let main: MainClassData
  let weather: [WeatherData]
  let dtTxt: String

  enum CodingKeys: String, CodingKey {
    case main, weather
    case dtTxt = "dt_txt"
  }
}

// MARK: - MainClassData
struct MainClassData: Codable, Equatable {
  let temp, tempMin, tempMax: Double

  enum CodingKeys: String, CodingKey {
    case temp
    case tempMin = "temp_min"
    case tempMax = "temp_max"
  }
}

// MARK: - WeatherData
struct WeatherData: Codable, Equatable {
  let id: Int
  let main: MainEnum
  let description, icon: String
}

enum MainEnum: String, Codable, Equatable {
  case clear = "Clear"
  case clouds = "Clouds"
  case rain = "Rain"
  case undefined = ""
}
