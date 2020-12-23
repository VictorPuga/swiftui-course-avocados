//
//  DishesView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 22/12/20.
//

import SwiftUI

struct DishesView: View {
  // MARK: - Properties
  let leftData: [(icon: String, label: String, i: Int)] = [
    ("icon-toasts",  "Toasts",  0),
    ("icon-tacos",   "Tacos",   1),
    ("icon-salads",  "Salads",  2),
    ("icon-halfavo", "Spreads", 3),
  ]
  
  let rightData: [(icon: String, label: String, i: Int)] = [
    ("icon-guacamole", "Guacamole", 0),
    ("icon-sandwiches",  "Sandwich",  1),
    ("icon-soup",   "Soup",   2),
    ("icon-smoothies",  "Smoothies",  3),
  ]
  
  
  // MARK: - Body
  var body: some View {
    HStack(alignment: .center, spacing: 8) {
      // Col 1
      VStack(alignment: .leading, spacing: 4) {
        ForEach(leftData, id: \.icon) { item in
          Group {
            HStack {
              Image(item.icon)
                .resizable()
                .modifier(IconModifier())
              Spacer()
              Text(item.label)
            }
            if item.i != 3 {
              Divider()
            }
          }
        } // :ForEach
      }
      // Col 2
      VStack(alignment: .center, spacing: 8) {
        HStack {
          Divider()
        }
        Image(systemName: "heart.circle")
          .font(Font.title.weight(.ultraLight))
          .imageScale(.large)
        HStack {
          Divider()
        }
      }
      // Col 3
      VStack(alignment: .trailing, spacing: 4) {
        ForEach(rightData, id: \.icon) { item in
          Group {
            HStack {
              Text(item.label)
              Spacer()
              Image(item.icon)
                .resizable()
                .modifier(IconModifier())
            }
            if item.i != 3 {
              Divider()
            }
          }
        } // :ForEach
      }
    } // :HStack
    .font(.system(.callout, design: .serif))
    .foregroundColor(.gray)
    .padding(.horizontal)
    .frame(maxHeight: 220)
  }
}

struct IconModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 42, height: 42, alignment: .center)
  }
}

// MARK: - Preview
struct DishesView_Previews: PreviewProvider {
  static var previews: some View {
    DishesView()
      .previewLayout(.fixed(width: 414, height: 280))
  }
}
