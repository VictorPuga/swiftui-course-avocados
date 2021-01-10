//
//  SettingsView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 21/12/20.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - Properties
  @State private var enableNotifications: Bool = true
  @State private var backgroundRefresh: Bool = false
  
  let appData: [(key: String, value: String)] = [
    ("Product", "Avocado Recipes"),
    ("Compatibility", "iPhone & iPad"),
    ("Developer", "Victor Puga"),
    ("Designer", "Robert Petras"),
    ("Website", "swiftuimasterclass.com"),
    ("Version", "1.0.0"),
  ]
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      VStack(alignment: .center, spacing: 5) {
        Image("avocado")
          .resizable()
          .scaledToFit()
          .padding(.top)
          .frame(width: 100, height: 100, alignment: .center)
          .shadow(
            color: Color("ColorBlackTransparentLight"),
            radius: 8,
            x: 0,
            y: 4
          )
        
        Text("Avocados".uppercased())
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(Color("ColorGreenAdaptive"))
      }
      .padding()
      
      Form {
        // MARK: Section 1
        Section(header: Text("General Settings")) {
          Toggle(isOn: $enableNotifications) {
            Text("Enable notifications")
          }
          Toggle(isOn: $backgroundRefresh) {
            Text("Background Refresh")
          }
        }
        
        // MARK: Section 2
        Section(header: Text("Application")) {
          if enableNotifications {
            ForEach(appData, id: \.key) { item in
              HStack {
                Text(item.key)
                  .foregroundColor(.gray)
                Spacer()
                Text(item.value)
              }
            }
          } else {
            HStack {
              Text("Personal message")
                .foregroundColor(.gray)
              Spacer()
              Text("Happy Coding!")
            }
          }
        }
      }
    }
    .frame(maxWidth: 640)
  }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
