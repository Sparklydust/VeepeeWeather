//
//  TabBarNavigationView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// iOS classic tab bar definition with
/// all main tab views.
struct TabBarNavigationView: View {
  
  var body: some View {
    Text("VeepeeWeather on iPhone!")
  }
}

// MARK: - Previews
struct TabBarNavigationView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      TabBarNavigationView()

      TabBarNavigationView()
        .preferredColorScheme(.dark)
    }
    .previewDevice(
      PreviewDevice(rawValue: iPhone))
  }
}
