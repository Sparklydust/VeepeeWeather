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
  @ObservedObject var cityModel = CityModel()

  // Services
  var coreDataService: CoreDataService
  var serverSideService: ServerSideProtocol

  // UI Levers
  @Published var isLoading = false
  @Published var weatherAlert: WeatherAlert = .unknown
  @Published var showDetails = false

  init(coreDataService: CoreDataService = CoreDataService(),
       serverSideService: ServerSideProtocol = ServerSideService()) {
    self.coreDataService = coreDataService
    self.serverSideService = serverSideService
  }
}

// MARK: - Actions
extension WeatherViewModel {

  /// Populate the ``WeatherDetailsView`` with the selected weather.
  /// - Parameter weather: The weather forecast to populate.
  func showDetailsView(for weather: WeatherModel) {
    cityModel.selectedWeather = weather
    showDetails = true
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

    populateSavedData()

    do {
      let data = try await serverSideService.getParisForecast()
      await cityModel.update(with: data)
      await coreDataService.save(cityModel)
    }
    catch { weatherAlert = .serverSideError }
  }

  /// Fetch saved ``CityEntity`` and populate them if any. 
  private func populateSavedData() {
    guard let cityEntity = coreDataService.fetchCities().first else { return }
    cityModel.update(with: cityEntity)
  }
}
