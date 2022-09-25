//
//  ServerSideError.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation

/// Error identifiers for api calls failure responses.
enum ServerSideError: String, Error, Equatable {

  case internalServerError
  case invalidResponse
  case unknown
}
