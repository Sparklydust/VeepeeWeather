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
  func testServideSideService_successfulAPICallIsMadeToFetchFiveDaysForecastInParis_forecastValueHasForecastDataFromAPI() async throws {
    let expected: ForecastData = .fake()
    let data = try json(fake: .forecastData)
    let response = status(code: 200)
    let urlSessionMock = URLSessionMock(data: data, response: response)
    sut.serverSideService = ServerSideServiceMock(urlSession: urlSessionMock)
    sut.forecast = .none

    await sut.getParisForecast()
    let result = sut.forecast

    XCTAssertEqual(result, expected, "The data fetched from api must be set in the `forecast` publisher as the city of \(expected.city.name)")
  }

  func testServideSideService_failedAPICallIsMadeToFetchFiveDaysForecastInParis_weatherAlertValueIsEqualToWeatherAlertServerSideError() async {
    let expected: WeatherAlert = .serverSideError
    let urlSessionMock = URLSessionMock(error: .internalServerError)
    sut.serverSideService = ServerSideServiceMock(urlSession: urlSessionMock)
    sut.weatherAlert = .unknown

    await sut.getParisForecast()
    let result = sut.weatherAlert

    XCTAssertEqual(result, expected, "weatherAlert must be `\(expected)` when api call fails")
  }

  func testServideSideService_parisForecastIsBeingFetchedFromAPI_isLoadingIsTrueAndActivityControllerIsSpinning() async {
    sut.isLoading = false

    serverSideServiceMock.onPerformAsyncAwait = {
      let result = self.sut.isLoading

      XCTAssertTrue(result, "isLoading must be true so progress spins when user fetched data on WeatherView appearance")
    }
    await sut.getParisForecast()
  }

  func testServideSideService_parisForecastWasFetchedFromAPI_isLoadingIsFalseAndActivityControllerStopSpinning() async {
    let urlSessionMock = URLSessionMock()
    sut.serverSideService = ServerSideServiceMock(urlSession: urlSessionMock)

    await sut.getParisForecast()
    let result = sut.isLoading

    XCTAssertFalse(result, "isLoading must be false so progress stop when user fetched data successfully when WeatherView appears")
  }
}
