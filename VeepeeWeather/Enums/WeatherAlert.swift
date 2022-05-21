//
//  WeatherAlert.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation

/// Alert that can be triggered from the
/// ``WeatherViewModel``.
enum WeatherAlert {

  case serverSideError
  case unknown
}
