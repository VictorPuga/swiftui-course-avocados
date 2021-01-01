//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 01/01/21.
//

import SwiftUI

struct RecipeCardView: View {
  // MARK: - Properties
  var recipe: Recipe
  
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      // Card image
      Image(recipe.image)
        .resizable()
        .scaledToFit()
        .overlay(
          HStack {
            Spacer()
            VStack {
              Image(systemName: "bookmark")
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .imageScale(.small)
                .shadow(
                  color: Color("ColorBlackTransparentLight"),
                  radius: 2,
                  x: 0,
                  y: 0
                )
                .padding(.trailing, 20)
                .padding(.top, 22)
              Spacer()
            }
          }
        ) // :overlay
      
      VStack(alignment: .leading, spacing: 12) {
        // Title
        Text(recipe.title)
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(Color("ColorGreenMedium"))
          .lineLimit(1)
        
        // Headline
        Text(recipe.headline)
          .font(.system(.body, design: .serif))
          .foregroundColor(.gray)
          .italic()
        
        // Rating
        HStack(alignment: .center, spacing: 5) {
          ForEach(0..<(recipe.rating), id: \.self) { item in
            Image(systemName: "star.fill")
              .font(.body)
              .foregroundColor(.yellow)
          }
        }
        
        // Cooking
        HStack(alignment: .center, spacing: 12) {
          HStack(alignment: .center, spacing: 2) {
            Image(systemName: "person.2")
            Text("Serves: \(recipe.serves)")
          }
          HStack(alignment: .center, spacing: 2) {
            Image(systemName: "clock")
            Text("Prep: \(recipe.preparation)")
          }
          HStack(alignment: .center, spacing: 2) {
            Image(systemName: "flame")
            Text("Cooking: \(recipe.cooking)")
          }
        }
        .font(.footnote)
        .foregroundColor(.gray)
        
      }
      .padding()
      .padding(.bottom, 12)
    }
    .background(Color.white)
    .cornerRadius(12)
    .shadow(
      color: Color("ColorBlackTransparentLight"),
      radius: 8,
      x: 0,
      y: 0
    )
  }
}

// MARK: - Preview
struct RecipeCardView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeCardView(recipe: recipesData[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}