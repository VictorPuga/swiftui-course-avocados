//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 01/01/21.
//

import SwiftUI

struct RecipeRatingView: View {
  // MARK: - Properties
  var recipe: Recipe
  
  
  // MARK: - Body
  var body: some View {
    HStack(alignment: .center, spacing: 5) {
      ForEach(0..<(recipe.rating), id: \.self) { item in
        Image(systemName: "star.fill")
          .font(.body)
          .foregroundColor(.yellow)
      }
    }
  }
}

// MARK: - Preview
struct RecipeRatingView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeRatingView(recipe: recipesData[0])
      .previewLayout(.fixed(width: 320, height: 60))
  }
}
