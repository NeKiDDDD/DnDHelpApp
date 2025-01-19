//
//  ClassDetailView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct ClassDetailView: View {
  let dndClass: DndClass
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        header
        content
      }
      .padding()
      .navigationBarTitle(dndClass.name, displayMode: .inline)
    }
  }
  
  private var header: some View {
    VStack(alignment: .leading) {
      Text(dndClass.name)
        .font(.largeTitle)
        .fontWeight(.bold)
      
      if let hitDice = dndClass.hitDice {
        Text("Hit Dice: \(hitDice)")
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
    }
  }
  
  private var content: some View {
    VStack(alignment: .leading, spacing: 8) {
      if let description = dndClass.description {
        Text(description)
          .font(.body)
          .multilineTextAlignment(.leading)
      }
      
      Group {
        if let profArmor = dndClass.profArmor {
          Text("Armor Proficiencies: \(profArmor)")
            .font(.subheadline)
        }
        
        if let profWeapons = dndClass.profWeapons {
          Text("Weapon Proficiencies: \(profWeapons)")
            .font(.subheadline)
        }
        
        if let profSavingThrows = dndClass.profSavingThrows {
          Text("Saving Throws: \(profSavingThrows)")
            .font(.subheadline)
        }
        
        if let equipment = dndClass.equipment {
          Text("Starting Equipment: \(equipment)")
            .font(.subheadline)
        }
      }
    }
  }
}

//#Preview {
//  ClassDetailView()
//}
