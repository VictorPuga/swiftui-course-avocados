//
//  AvocadosView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 21/12/20.
//

import SwiftUI

struct AvocadosView: View {
  // MARK: - Properties
  @State private var pulseAnimation: Bool = false


  // MARK: - Body
  var body: some View {
    VStack {
      Spacer()
      
      Image("avocado")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 240)
        .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
        .scaleEffect(pulseAnimation ? 1: 0.9)
        .opacity(pulseAnimation ? 1 : 0.9)
        .animation(
          Animation.easeInOut(duration: 1.5)
            .repeatForever(autoreverses: true)
        )
      
      VStack {
        Text("Avocados".uppercased())
          .font(.system(size: 42, weight: .bold, design: .serif))
          .foregroundColor(.white)
          .padding()
          .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
        Text("""
          Creamy, green, and full of nutrients!
          Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
          """)
          .lineLimit(nil)
          .font(.system(.headline, design: .serif))
          .foregroundColor(Color("ColorGreenLight"))
          .multilineTextAlignment(.center)
          .lineSpacing(8)
          .frame(maxWidth: 640, minHeight: 120)
      } // :VStack
      .padding()
      Spacer()
    } // :VStack
    .background(
      Image("background")
        .resizable()
        .scaledToFill()
    )
    .edgesIgnoringSafeArea(.all)
    .onAppear {
      withAnimation {
        pulseAnimation.toggle()
      }
    } // :onAppear
  }
}

// MARK: - Preview
struct AvocadosView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AvocadosView()
//      AvocadosView().environment(\.colorScheme, .dark)
    }
  }
}
