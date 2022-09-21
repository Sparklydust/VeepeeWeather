//
//  AsyncImageView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/09/2022.
//

import SwiftUI

/// Image Loading view with a placeholder when
/// being fetched and an error image if no data.
struct AsyncImageView: View {

  var imageURL: String

  init(imageURL: String) {
    let completeURL = "http://openweathermap.org/img/wn/\(imageURL)@2x.png"
    self.imageURL = completeURL
  }

  var body: some View {
    AsyncImage(url: URL(string: imageURL)!) { phase in

      if phase.error == nil, phase.image == nil {
        ProgressView()
      }
      else {
        ZStack {
          if let image = phase.image {
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
          }
          else {
            Image(systemName: "photo")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .foregroundColor(.accentColor)
          }
        }
      }
    }
    .cornerRadius(8)
  }
}

// MARK: - Previews
struct AsyncImageView_Previews: PreviewProvider {

  static var previews: some View {
    AsyncImageView(imageURL: "www.fake.url.com")
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
