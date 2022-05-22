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
    let cod: String
    let message, cnt: Int
    let list: [ListData]
    let city: CityData
}

// MARK: - CityData
struct CityData: Codable, Equatable {
    let id: Int
    let name: String
    let coord: CoordData
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - CoordData
struct CoordData: Codable, Equatable {
    let lat, lon: Double
}

// MARK: - ListData
struct ListData: Codable, Equatable {
    let dt: Int
    let main: MainClassData
    let weather: [WeatherData]
    let clouds: CloudsData
    let wind: WindData
    let visibility: Int
    let pop: Double
    let sys: SysData
    let dtTxt: String
    let rain: RainData?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - CloudsData
struct CloudsData: Codable, Equatable {
    let all: Int
}

// MARK: - MainClassData
struct MainClassData: Codable, Equatable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - RainData
struct RainData: Codable, Equatable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - SysData
struct SysData: Codable, Equatable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - WeatherData
struct WeatherData: Codable, Equatable {
    let id: Int
    let main: MainEnum
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum MainEnum: String, Codable, Equatable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - WindData
struct WindData: Codable, Equatable {
    let speed: Double
    let deg: Int
    let gust: Double
}
