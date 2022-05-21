//
//  WeatherViewModel.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// Handle all the logic needed for the ``WeatherView``.
final class WeatherViewModel: ObservableObject {

  // Data
  @Published var forecast: ForecastData?

  // Services
  var serverSideService: ServerSideProtocol

  // UI Levers
  @Published var isLoading = false
  @Published var weatherAlert: WeatherAlert = .unknown

  init(serverSideService: ServerSideProtocol = ServerSideService()) {
    self.serverSideService = serverSideService
  }
}

// MARK: - CustomProgressView
extension WeatherViewModel {
  /// Trigger or not the custom progress view from the isLoading publisher.
  /// - Parameter action: true or false to trigger the progress view.
  func showProgressView(_ action: Bool) {
    withAnimation(.easeInOut) { isLoading = action }
  }
}

// MARK: - ServerSideService
extension WeatherViewModel {

  /// Server side call to fetch Paris forecast for the next five days.
  @MainActor func getParisForecast() async {
    showProgressView(true)
    defer { showProgressView(false) }
    do { forecast = try await serverSideService.getParisForecast() }
    catch { weatherAlert = .serverSideError }
  }
}
