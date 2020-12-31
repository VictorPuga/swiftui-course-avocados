//
//  ContentView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 21/12/20.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  var headers: [Header] = headersData
  var facts: [Fact] = factsData
  
  // MARK: - Body
  var body: some View {
    ScrollView(.vertical) {
      VStack {
        // MARK: Header
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 0) {
            ForEach(headers) { item in
              HeaderView(header: item)
            }
          }
        }
        
        // MARK: Dishes
        Text("Avocado Dishes")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        DishesView()
          .frame(maxWidth: 640)
        
        // MARK: - Facts
        Text("Avocado Facts")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 60) {
            ForEach(facts) { item in
              FactsView(fact: item)
            }
          }
          .padding(.vertical)
          .padding(.leading, 60)
          .padding(.trailing, 20)
        }
        
        // MARK: Footer
        VStack(alignment: .center, spacing: 20) {
          Text("All About Avocados")
            .fontWeight(.bold)
            .modifier(TitleModifier())
            .frame(minHeight: 60)
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

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(.title, design: .serif))
      .foregroundColor(Color("ColorGreenAdaptive"))
      .padding(8)
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(headers: headersData, facts: factsData)
    // .environment(\.colorScheme, .dark)
  }
}
