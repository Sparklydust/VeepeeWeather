//
//  ContentView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

struct ContentView: View {

  var body: some View {
    Text("Hello, Veepee!")
      .padding()
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

public let iPhone = "iPhone 13 Pro"
public let iPad = "iPad Pro (11-inch) (3rd generation)"
