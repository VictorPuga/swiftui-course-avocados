//
//  HeaderView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 21/12/20.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - Properties
  var header: Header
  
  @State private var showHeadline: Bool = false
  
  var slideInAnimation: Animation {
    Animation
      .spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
      .speed(1)
      .delay(0.25)
  }
  
  // MARK: - Body
  var body: some View {
    ZStack {
      Image(header.image)
        .resizable()
        .scaledToFit()
      HStack(alignment: .top, spacing: 0) {
        Rectangle()
          .fill(Color("ColorGreenLight"))
          .frame(width: 4)
        
        VStack(alignment: .leading, spacing: 6) {
          Text(header.headline)
            .font(.system(.title, design: .serif))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .shadow(radius: 3)
          Text(header.subheadline)
            .font(.headline)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .shadow(radius: 3)
        } // :VStack
        .padding(.vertical, 0)
        .padding(.horizontal, 20)
        .frame(width: 281, height: 105)
        .background(Color("ColorBlackTransparentLight"))
      } // :HStack
      .frame(width: 285, height: 105, alignment: .center)
      .offset(x: -66, y: showHeadline ? 75 : 220)
      .animation(slideInAnimation)
      .onAppear {
        showHeadline.toggle()
      }
    } // :ZStack
    .frame(width: 480, height: 320, alignment: .center)
  }
}

// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(header: headersData[0])
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
