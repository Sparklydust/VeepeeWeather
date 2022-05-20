//
//  SideBarNavigationView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// Sidebar items for iPadOS navigation.
///
/// View that contains the SceneStorage for iPad navigations
/// when multiple windows is used.
struct SideBarNavigationView: View {

  var body: some View {
    Text("Veepee on iPad!")
  }
}

// MARK: - Previews
struct SideBarNavigationView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      SideBarNavigationView()

      SideBarNavigationView()
        .preferredColorScheme(.dark)
    }
    .previewDevice(
      PreviewDevice(rawValue: iPad))
  }
}
