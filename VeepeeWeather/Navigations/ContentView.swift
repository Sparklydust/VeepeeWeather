//
//  ContentView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// Root of the iOS and iPadOS views.
struct ContentView: View {

  @Environment(\.horizontalSizeClass) private var horizontalSizeClass

  var body: some View {
    if horizontalSizeClass == .compact {
      TabBarNavigationView() // iPhone
    }
    else {
      SideBarNavigationView() // iPad
    }
  }
}

// MARK: - Previews
struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      ContentView()
        .previewDevice(
          PreviewDevice(rawValue: iPhone))

      ContentView()
        .previewDevice(
          PreviewDevice(rawValue: iPad))
    }
  }
}

/// Canvas of an iPhone for SwiftUI previews
public let iPhone = "iPhone 13 Pro"
/// Canvas of an iPad for SwiftUI previews
public let iPad = "iPad Pro (11-inch) (3rd generation)"
