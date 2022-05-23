//
//  WeatherLocal.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 22/05/2022.
//

import Foundation

/// The city weater value of a day.
struct WeatherLocal {

  var type: MainEnum
  var date: Date
  var temp: Double
  var tempMin: Double
  var tempMax: Double
  var info: String
}
