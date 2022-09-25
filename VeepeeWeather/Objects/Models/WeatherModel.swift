//
//  WeatherModel.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 22/05/2022.
//

import SwiftUI

/// The city weather value of a day.
struct WeatherModel: Identifiable {
  
  var id: UUID
  var type: MainEnum
  var icon: String 
  var date: Date
  var temp: Double
  var tempMin: Double
  var tempMax: Double
  var info: String

  init(id: UUID,
       type: MainEnum,
       icon: String,
       date: Date,
       temp: Double,
       tempMin: Double,
       tempMax: Double,
       info: String) {
    self.id = id
    self.type = type
    self.icon = icon
    self.date = date
    self.temp = temp
    self.tempMin = tempMin
    self.tempMax = tempMax
    self.info = info
  }

  init(with weatherEntity: WeatherEntity) {
    self.id = UUID()
    self.type = MainEnum(rawValue: weatherEntity.type ?? String()) ?? .undefined
    self.icon = weatherEntity.icon ?? String()
    self.date = weatherEntity.date ?? Date()
    self.temp = weatherEntity.temp
    self.tempMin = weatherEntity.tempMin
    self.tempMax = weatherEntity.tempMax
    self.info = weatherEntity.info ?? String()
  }
}
