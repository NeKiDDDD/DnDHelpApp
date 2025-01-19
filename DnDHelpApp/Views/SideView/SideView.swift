//
//  SideView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 24.07.2024.
//

import SwiftUI

struct SideView: View {
  
  var body: some View {
    ZStack {
      ScrollView(showsIndicators: false) {
        VStack(alignment: .leading, spacing: 10) {
          Divider()
          MultyTextView(string: "Справочники", textSize: 15, textColor: .black, font: .medium, weight: .medium)
          Divider()
          ForEach(ConstantAppInfo.LibrarySection.allCases, id: \.buttonDescriprion) { libraryItem in
            Button(action: {}) {
              MultyTextView(string: libraryItem.buttonDescriprion, textSize: 13, textColor: .blue, font: .medium, textAlignment: .leading, weight: .medium)
            }
          }
          Divider()
          MultyTextView(string: "Персонаж", textSize: 15, textColor: .black, font: .medium, weight: .medium)
          Divider()
          ForEach(ConstantAppInfo.CharacterSection.allCases, id: \.buttonDescriprion) { libraryItem in
            Button(action: {}) {
              MultyTextView(string: libraryItem.buttonDescriprion, textSize: 13, textColor: .blue, font: .medium, textAlignment: .leading, weight: .medium)
            }
          }
          Divider()
          MultyTextView(string: "Генераторы", textSize: 15, textColor: .black, font: .medium, weight: .medium)
          Divider()
          ForEach(ConstantAppInfo.GeneratorSection.allCases, id: \.buttonDescriprion) { libraryItem in
            Button(action: {}) {
              MultyTextView(string: libraryItem.buttonDescriprion, textSize: 13, textColor: .blue, font: .medium, textAlignment: .leading, weight: .medium)
            }
          }
        }
      }.padding()
    }
    .padding(.vertical, 20)
  }
}

#Preview {
  SideView()
}

