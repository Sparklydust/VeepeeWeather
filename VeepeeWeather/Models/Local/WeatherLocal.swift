//
//  WeatherLocal.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 22/05/2022.
//

import SwiftUI

/// The city weather value of a day.
struct WeatherLocal: Identifiable {
  
  var id: UUID
  var type: MainEnum
  var icon: String 
  var date: Date
  var temp: Double
  var tempMin: Double
  var tempMax: Double
  var info: String
}
