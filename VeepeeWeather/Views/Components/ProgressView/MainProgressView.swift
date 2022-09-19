//
//  MainProgressView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// View that populates the ProgressView with a transparent background.
///
/// A background color is added to not allow the user to
/// perform actions during the loading process from the server
/// side call that has triggered the activity controller.
struct MainProgressView: View {

  var isAnimating: Bool

  var body: some View {
    ZStack {
      if isAnimating {
        Color.systemGroupedBackground.opacity(0.75)
          .edgesIgnoringSafeArea(.all)
          .transition(.opacity)

        ProgressView()
          .scaleEffect(1.6)
          .progressViewStyle(
            CircularProgressViewStyle(tint: .accentColor))
      }
    }
  }
}

// MARK: - Previews
struct MainProgressView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      MainProgressView(isAnimating: false)
        .previewDevice(
          PreviewDevice(rawValue: iPhone))

      MainProgressView(isAnimating: false)
        .previewDevice(
          PreviewDevice(rawValue: iPad))
    }
  }
}
