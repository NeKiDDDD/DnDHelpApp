//
//  MonsterDetailView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct MonsterDetailView: View {
  let monster: Monster
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
//        Text(monster.name)
//          .font(.largeTitle)
//          .fontWeight(.bold)
        
//        if let type = monster.type {
//          Text("Type: \(type)")
//            .font(.subheadline)
//        }
//        
//        if let alignment = monster.alignment {
//          Text("Alignment: \(alignment)")
//            .font(.subheadline)
//        }
//        
//        if let hitPoints = monster.hitPoints {
//          Text("Hit Points: \(hitPoints)")
//            .font(.subheadline)
//        }
//        
//        if let armorClass = monster.armorClass {
//          Text("Armor Class: \(armorClass)")
//            .font(.subheadline)
//        }
//        
//        if let actions = monster.actions {
//          Text("Actions:")
//            .font(.headline)
//          ForEach(actions, id: \.name) { action in
//            Text("• \(action.name): \(action.description)")
//              .font(.body)
//          }
//        }
      }
      .padding()
    }
  }
}

//#Preview {
//  MonsterDetailView()
//}
