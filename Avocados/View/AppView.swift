//
//  AppView.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 21/12/20.
//

import SwiftUI

struct AppView: View {
  // MARK: - Body
  var body: some View {
    TabView {
      AvocadosView()
        .tabItem {
          Label("Avocados", image: "tabicon-branch")
        }
      ContentView()
        .tabItem {
          Label("Recipes", image: "tabicon-book")
        }
      RipeningStagesView()
        .tabItem {
          Label("Ripening", image: "tabicon-avocado")
        }
      SettingsView()
        .tabItem {
          Label("Settings", image: "tabicon-settings")
        }
    }
  }
}

// MARK: - Preview
struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
      .preferredColorScheme(.dark)
  }
}
