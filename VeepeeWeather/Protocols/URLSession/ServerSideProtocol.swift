//
//  ServerSideProtocol.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation

/// Server side api calls definitions that are needed for
/// the VeepeeWeather application.
protocol ServerSideProtocol {

  /// Intializer to pass ``URLSession`` as a protocol
  /// to inject a mock during Unit Tests.
  /// - Parameter urlSession: The main ``URLSession``
  /// tool from the ``Foundation`` framework.
  init(urlSession: URLSessionProtocol)

  /// Fetch five days of the Paris weather.
  /// - Returns: Data with the forecast of the Paris city.
  func getParisFiveDaysForecast() async throws -> ForecastData
}
