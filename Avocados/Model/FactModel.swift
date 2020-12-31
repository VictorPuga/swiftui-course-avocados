//
//  FactModel.swift
//  Avocados
//
//  Created by Víctor Manuel Puga Ruiz on 30/12/20.
//

import SwiftUI

struct Fact: Identifiable {
  var id = UUID()
  var image: String
  var content: String
}
