//
//  WeatherViewModel.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// Handle all the logic needed for the ``WeatherView``.
final class WeatherViewModel: ObservableObject {

  // Local
  @ObservedObject var cityLocal = CityLocal()

  // Services
  var coreDataService: CoreDataService
  var serverSideService: ServerSideProtocol

  // UI Levers
  @Published var isLoading = false
  @Published var weatherAlert: WeatherAlert = .unknown

  init(coreDataService: CoreDataService = CoreDataService(),
       serverSideService: ServerSideProtocol = ServerSideService()) {
    self.coreDataService = coreDataService
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

    do {
      let data = try await serverSideService.getParisForecast()
      await cityLocal.update(with: data)
      coreDataService.save(city: data)
    } catch {
      cityLocal.update(with: coreDataService.cities)
      weatherAlert = .serverSideError
    }
  }
}
