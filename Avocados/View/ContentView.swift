//
//  ContentView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 21/12/20.
//

import SwiftUI

struct ContentView: View {
  var headers: [Header] = headersData
  
  // MARK: - Body
  var body: some View {
    ScrollView(.vertical) {
      VStack {
        // Header
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 0) {
            ForEach(headers) { item in
              HeaderView(header: item)
            }
          }
        }
        
        // Footer
        VStack(alignment: .center, spacing: 20) {
          Text("All About Avodados")
            .font(.system(.title, design: .serif))
            .fontWeight(.bold)
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding()
          Text("Everything you wanted to know about avocados but were too afraid to ask.")
            .font(.system(.body, design: .serif))
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
        } // :Footer
        .frame(maxWidth: 640)
        .padding()
        .padding(.bottom, 85)
      }
    } // :ScrollView
    .edgesIgnoringSafeArea(.all)
    .padding(0)
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(headers: headersData)
//      .environment(\.colorScheme, .dark)
  }
}
