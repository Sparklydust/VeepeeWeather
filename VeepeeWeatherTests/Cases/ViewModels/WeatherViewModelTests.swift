//
//  WeatherViewModelTests.swift
//  VeepeeWeatherTests
//
//  Created by Roland Lariotte on 21/05/2022.
//

import XCTest
@testable import VeepeeWeather

class WeatherViewModelTests: XCTestCase {

  var sut: WeatherViewModel!

  var coreDataServiceMock: CoreDataService!
  var urlSessionMock: URLSessionMock!
  var serverSideServiceMock: ServerSideServiceMock!

  override func setUpWithError() throws {
    try super.setUpWithError()
    coreDataServiceMock = CoreDataService(inMemory: true)
    urlSessionMock = URLSessionMock()
    serverSideServiceMock = ServerSideServiceMock(urlSession: urlSessionMock)

    sut = WeatherViewModel(
      coreDataService: coreDataServiceMock,
      serverSideService: serverSideServiceMock)
  }

  override func tearDownWithError() throws {
    serverSideServiceMock = .none
    urlSessionMock = .none
    coreDataServiceMock = .none
    sut = .none
    try super.tearDownWithError()
  }
}

// MARK: - ServerSideService
extension WeatherViewModelTests {
  @MainActor func testServideSideService_successfulAPICallIsMadeToFetchFiveDaysForecastInParis_cityModelNameIsEqualToParis() async throws {
    let expected = ForecastData.fake().city.name
    let data = try json(fake: .forecastData)
    let response = status(code: 200)
    let urlSessionMock = URLSessionMock(data: data, response: response)
    sut.serverSideService = ServerSideServiceMock(urlSession: urlSessionMock)
    sut.cityModel.name = String()

    await sut.getParisForecast()
    let result = sut.cityModel.name

    XCTAssertEqual(result, expected, "The data fetched from api must set the `cityModel` object city name to `\(expected)`")
  }

  @MainActor func testServideSideService_failedAPICallIsMadeToFetchFiveDaysForecastInParis_weatherAlertValueIsEqualToWeatherAlertServerSideError() async {
    let expected: WeatherAlert = .serverSideError
    let urlSessionMock = URLSessionMock(error: .internalServerError)
    sut.serverSideService = ServerSideServiceMock(urlSession: urlSessionMock)
    sut.weatherAlert = .unknown

    await sut.getParisForecast()
    let result = sut.weatherAlert

    XCTAssertEqual(result, expected, "weatherAlert must be `\(expected)` when api call fails")
  }

  @MainActor func testServideSideService_parisForecastIsBeingFetchedFromAPI_isLoadingIsTrueAndActivityControllerIsSpinning() async {
    sut.isLoading = false

    serverSideServiceMock.onPerformAsyncAwait = {
      let result = self.sut.isLoading

      XCTAssertTrue(result, "isLoading must be true so progress spins when user fetched data on WeatherView appearance")
    }
    await sut.getParisForecast()
  }

  @MainActor func testServideSideService_parisForecastWasFetchedFromAPI_isLoadingIsFalseAndActivityControllerStopSpinning() async {
    let urlSessionMock = URLSessionMock()
    sut.serverSideService = ServerSideServiceMock(urlSession: urlSessionMock)

    await sut.getParisForecast()
    let result = sut.isLoading

    XCTAssertFalse(result, "isLoading must be false so progress stop when user fetched data successfully when WeatherView appears")
  }
}
