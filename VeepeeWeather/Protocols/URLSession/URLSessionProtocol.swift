//
//  URLSessionProtocol.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation

/// Add URLSessionProtocol on top of URLSession
/// to reduce the dependency for testing.
extension URLSession: URLSessionProtocol {}

/// Nods the head on top of URLSession to reduce the dependency
/// and have it injected as a mock for testing.
protocol URLSessionProtocol {

  /// Downloads the contents of a URL based on the specified URL request and
  /// delivers the data asynchronously.
  ///
  /// Use this method to wait until the session finishes transferring data and
  /// receive it in a single Data instance. To process the bytes as the session
  /// receives them, use bytes(for:delegate:).
  /// - Parameters:
  ///   - request: A URL request object that provides request-specific information
  ///   such as the URL, cache policy, request type, and body data or body stream.
  ///   - delegate: A delegate that receives life cycle and authentication challenge
  ///   callbacks as the transfer progresses.
  /// - Returns: An asynchronously-delivered tuple that contains the URL contents
  /// as a Data instance, and a URLResponse.
  func data(
    for request: URLRequest,
    delegate: URLSessionTaskDelegate?
  ) async throws -> (Data, URLResponse)
}
