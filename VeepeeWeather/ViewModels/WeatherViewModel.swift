//
//  WeatherViewModel.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation

/// Handle all the logic needed for the ``WeatherView``.
final class WeatherViewModel: ObservableObject {

  let serverSideService: ServerSideProtocol

  init(serverSideService: ServerSideProtocol = ServerSideService()) {
    self.serverSideService = serverSideService
  }
}
