//
//  WeatherDetailsView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 20/09/2022.
//

import SwiftUI

/// Populate a full view with the details of a
/// forecast for a same day. 
struct WeatherDetailsView: View {

  var body: some View {
    Text("WeatherDetailsView")
  }
}

struct WeatherDetailsView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      WeatherDetailsView()
        .previewDevice(PreviewDevice(rawValue: iPhone))

      WeatherDetailsView()
        .previewDevice(PreviewDevice(rawValue: iPhone))
    }
  }
}
