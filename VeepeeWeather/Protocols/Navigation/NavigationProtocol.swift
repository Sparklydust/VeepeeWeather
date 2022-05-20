//
//  NavigationProtocol.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Combine

/// Nods the head on top of ``NavigationService`` to
/// reduce the dependency for unit and UI testing purposes.
protocol NavigationManagerProtocol {

  var tabBar: CurrentValueSubject<NavigationItem, Never> { get set }
}
