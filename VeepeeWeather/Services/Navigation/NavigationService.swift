//
//  NavigationService.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Combine

/// Responsible to keep track and navigate between tab bar items.
final class NavigationManager: NavigationManagerProtocol, ObservableObject {

  /// Tab view selector set in TabBarNavigationView.
  var tabBar = CurrentValueSubject<NavigationItem, Never>(.weather)
}
