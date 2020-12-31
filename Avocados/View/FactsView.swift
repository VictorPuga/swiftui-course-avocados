//
//  FactsView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 30/12/20.
//

import SwiftUI

struct FactsView: View {
  // MARK: - Properties
  var fact: Fact
  
  // MARK: - Body
  var body: some View {
    ZStack {
      Text(fact.content)
        .padding(.leading, 55)
        .padding(.trailing, 10)
        .padding(.vertical, 3)
        .frame(width: 300, height: 135, alignment: .center)
        .background(
          LinearGradient(
            gradient: Gradient(
              colors: [
                Color("ColorGreenMedium"),
                Color("ColorGreenLight")
              ]
            ),
            startPoint: .leading,
            endPoint: .trailing
          )
        ) // :background
        .cornerRadius(12)
        .lineLimit(6)
        .multilineTextAlignment(.leading)
        .font(.footnote)
        .foregroundColor(.white)
      
      Image(fact.image)
        .resizable()
        .frame(width: 66, height: 66, alignment: .center)
        .clipShape(Circle())
        // inner white circle
        .background(
          Circle()
            .fill(Color.white)
            .frame(width: 74, height: 74, alignment: .center)
        )
        // center gradient circle
        .background(
          Circle()
            .fill(
              LinearGradient(
                gradient: Gradient(
                  colors: [
                    Color("ColorGreenMedium"),
                    Color("ColorGreenLight")
                  ]
                ),
                startPoint: .leading,
                endPoint: .trailing
              )
            )
            .frame(width: 82, height: 82, alignment: .center)
        )
        // outer adaptive circle
        .background(
          Circle()
            .fill(Color("ColorAppearanceAdaptive"))
            .frame(width: 90, height: 90, alignment: .center)
        )
        .offset(x: -150)
    }
    
  }
}

// MARK: - Preview
struct FactsView_Previews: PreviewProvider {
  static var previews: some View {
    FactsView(fact: factsData[0])
      .previewLayout(.fixed(width: 400, height: 220))
  }
}
