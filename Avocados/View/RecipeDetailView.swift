//
//  RecipeDetailView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 01/01/21.
//

import SwiftUI

struct RecipeDetailView: View {
  // MARK: - Properties
  var recipe: Recipe
  
  @State private var pulsate: Bool = false
  
  // MARK: - Body
  var body: some View {
    ScrollView {
      VStack(alignment: .center, spacing: 0) {
        Image(recipe.image)
          .resizable()
          .scaledToFit()
        Group {
          // MARK: - Title
          Text(recipe.title)
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(.top, 10)
          
          // MARK: - Ratings
          RecipeRatingView(recipe: recipe)
          
          // MARK: - Cooking
          RecipeCookingView(recipe: recipe)
          
          // MARK: - Ingredients
          Text("Ingredients")
            .fontWeight(.bold)
            .modifier(TitleModifier())
          
          VStack(alignment: .leading, spacing: 5) {
            ForEach(recipe.ingredients, id: \.self) { item in
              VStack(alignment: .leading, spacing: 5) {
                Text(item)
                  .font(.footnote)
                  .multilineTextAlignment(.leading)
                Divider()
              }
            } // :ForEach
          }
          
          // MARK: - Instructions
          Text("Instructions")
            .fontWeight(.bold)
            .modifier(TitleModifier())
          
          ForEach(recipe.instructions, id: \.self) { item in
            VStack(alignment: .center, spacing: 5) {
              Image(systemName: "chevron.down.circle")
                .resizable()
                .frame(width: 42, height: 43, alignment: .center)
                .imageScale(.large)
                .font(Font.title.weight(.ultraLight))
                .foregroundColor(Color("ColorGreenAdaptive"))
              
              Text(item)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .font(.system(.body, design: .serif))
                .frame(minHeight: 100)
            }
          }
          
          
        } // :Group
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
      } // :VStack
    }
    .edgesIgnoringSafeArea(.top)
    .overlay(
      HStack {
        Spacer()
        VStack {
          Button(action: {}) {
            Image(systemName: "chevron.down.circle.fill")
              .font(.title)
              .foregroundColor(.white)
              .shadow(radius: 4)
              .opacity(self.pulsate ? 1 : 0.6)
              .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
              .animation(
                Animation
                  .easeInOut(duration: 1.5)
                  .repeatForever(autoreverses: true)
              )
          }
          .padding(.trailing, 20)
          .padding(.top, 24)
          Spacer()
        }
      }
    ) // :overlay
    .onAppear {
      self.pulsate.toggle()
    }
  }
}

// MARK: - Preview
struct RecipeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeDetailView(recipe: recipesData[0])
  }
}
