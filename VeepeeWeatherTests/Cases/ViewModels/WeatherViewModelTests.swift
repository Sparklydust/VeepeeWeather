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
  var urlSessionMock: URLSessionMock!
  var serverSideServiceMock: ServerSideServiceMock!

  override func setUpWithError() throws {
    try super.setUpWithError()
    urlSessionMock = URLSessionMock()
    serverSideServiceMock = ServerSideServiceMock(urlSession: urlSessionMock)
    sut = WeatherViewModel(serverSideService: serverSideServiceMock)
  }

  override func tearDownWithError() throws {
    serverSideServiceMock = .none
    urlSessionMock = .none
    sut = .none
    try super.tearDownWithError()
  }
}
