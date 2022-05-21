//
//  ServerSideServiceMock.swift
//  VeepeeWeatherTests
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation
@testable import VeepeeWeather

final class ServerSideServiceMock: ServerSideProtocol {

  let urlRequestFake = URLRequest(url: URL(string: "https://fake.api.request.com")!)

  let urlSessionMock: URLSessionProtocol

  init(urlSession: URLSessionProtocol) {
    urlSessionMock = urlSession
  }

   func getParisFiveDaysForecast() async throws -> ForecastData {
    _ = try await urlSessionMock.data(for: urlRequestFake, delegate: .none)
    return .fake()
  }
}
