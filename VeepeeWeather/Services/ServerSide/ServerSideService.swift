//
//  ServerSideService.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation

/// Server side service that is responsible to fetch data
/// asynchronously from the https://openweathermap.org website.
final class ServerSideService: ServerSideProtocol {

  var urlSession: URLSessionProtocol

  /// Private api key from the https://openweathermap.org/api.
  ///
  /// - Info: Add your personal key in place of ``ProcessInfo``
  /// to make the VeepeeWeather application works.
  let apiKey = ProcessInfo.processInfo.environment["open_weather_api_key"]

  init(urlSession: URLSessionProtocol = URLSession.shared) {
    self.urlSession = urlSession
  }
}

// MARK: - Five Days Forecast
extension ServerSideService {

  func getParisForecast() async throws -> ForecastData {
    let urlRequest = URLRequest(
      url: URL(
        string: "http://api.openweathermap.org/data/2.5/forecast?lat=48.85341&lon=2.3488&units=metric&appid=\(apiKey!)")!
    )
    return try await serverSideCall(for: ForecastData.self, on: urlRequest)
  }
}

// MARK: - Session Call
extension ServerSideService {
  /// API request to get or post the data through the api request, or an error if failed.
  ///
  /// Used to fetch any data from the database using the needed url request.
  /// - Parameters:
  ///   - data: The data object that will be send or fetch from api.
  ///   - urlRequest: The url request that will perform the data request.
  /// - Returns: The desired data set in the data: T.Type place.
  private func serverSideCall<T: Codable>(
    for data: T.Type,
    on urlRequest: URLRequest
  ) async throws -> T {

    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    let validatedData = try validate(data, response)
    let request = try JSONDecoder().decode(T.self, from: validatedData)

    return request
  }
}

// MARK: - Request Response
extension ServerSideService {
  /// Validation of the response coming from the api call.
  ///
  /// Catch up status code response for its validation or
  /// throw a Server Side Error.
  /// - Parameters:
  ///   - data: Data coming from the api call if successful.
  ///   - response: HTTP response code to handle api errors.
  /// - Throws: ServerSideError from server.
  /// - Returns: Data if success or a ServerSideError.
  private func validate(
    _ data: Data,
    _ response: URLResponse
  ) throws -> Data {

    guard let httpResponse = response as? HTTPURLResponse
    else { throw ServerSideError.invalidResponse }

    guard httpResponse.statusCode < 500
    else { throw ServerSideError.internalServerError }

    guard (200..<300).contains(httpResponse.statusCode)
    else { throw ServerSideError.unknown }

    return data
  }
}
