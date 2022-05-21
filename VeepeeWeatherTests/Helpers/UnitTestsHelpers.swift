//
//  UnitTestsHelpers.swift
//  VeepeeWeatherTests
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation
import XCTest

// MARK: - Data+JsonFile
extension XCTestCase {
  /// Retrieve de json file from the Fakes/Jsons folder to pass fake
  /// server side data in unit tests.
  /// - Parameter fake: The name of the json file found in Fakes/Json.
  /// - Returns: The json model as data.
  func json(fake named: JsonFileName) throws -> Data {
    let bundleURL = try XCTUnwrap(
      Bundle(for: type(of: self))
        .url(forResource: named.rawValue, withExtension: "json")
    )
    return try Data(contentsOf: bundleURL)
  }
}

// MARK: - HTTPURLResponse+StatusCode
extension XCTestCase {
  /// Send a status code through ServerSide mocks to mimic an api response.
  /// - Parameter code: Fake Error Status Code that could have been sent
  /// from the ServerSide.
  /// - Returns: Fake url response with the added status code.
  func status(code: Int) -> HTTPURLResponse {
    return HTTPURLResponse(
      url: URL(string: "https://fake.api.request.com")!,
      statusCode: code,
      httpVersion: .none,
      headerFields: .none)!
  }
}
