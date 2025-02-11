//
//  ClassDetailView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct ClassDetailView: View {
  @State private var service = Open5eService()
  @State var endpoint: String = ""
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        header
        content
      }
      .padding()
      .navigationBarTitle(service.oneClass?.name ?? "", displayMode: .inline)
    }
    .onAppear {
      service.fetchOneClass(with: endpoint)
    }
  }
  
  private var header: some View {
    VStack(alignment: .leading) {
      Text(service.oneClass?.name ?? "")
        .font(.largeTitle)
        .fontWeight(.bold)
      
//      if let hitDice = dndClass.hitDie {
      Text("Hit Dice: \(service.oneClass?.hitDie ?? 12)")
          .font(.subheadline)
          .foregroundColor(.secondary)
//      }
    }
  }
  
  private var content: some View {
    VStack(alignment: .leading, spacing: 8) {
      if let description = service.oneClass?.proficiencyChoices {
        ForEach(description, id: \.desc) { description in
          Text(description.desc ?? "")
            .font(.body)
            .multilineTextAlignment(.leading)
          Text("\(description.choose ?? 1)")
            .font(.body)
            .multilineTextAlignment(.leading)
//          Text(description.from)
//            .font(.body)
//            .multilineTextAlignment(.leading)
//          Text("\(description.choose)")
//            .font(.body)
//            .multilineTextAlignment(.leading)
        }
      }
//      
//      Group {
//        if let profArmor = dndClass.profArmor {
//          Text("Armor Proficiencies: \(profArmor)")
//            .font(.subheadline)
//        }
//        
//        if let profWeapons = dndClass.profWeapons {
//          Text("Weapon Proficiencies: \(profWeapons)")
//            .font(.subheadline)
//        }
//        
//        if let profSavingThrows = dndClass.profSavingThrows {
//          Text("Saving Throws: \(profSavingThrows)")
//            .font(.subheadline)
//        }
//        
//        if let equipment = dndClass.equipment {
//          Text("Starting Equipment: \(equipment)")
//            .font(.subheadline)
//        }
//      }
    }
  }
}

//#Preview {
//  ClassDetailView()
//}


//let index, name: String
//let hitDie: Int
//let proficiencyChoices: [ProficiencyChoice]
//let proficiencies, savingThrows: [Condition]
//let startingEquipment: [StartingEquipment]
//let startingEquipmentOptions: [ClassStartingEquipmentOption]
//let classLevels: String
//let multiClassing: MultiClassing
//let subclasses: [Condition]
//let url: String
//let spellcasting: ClassSpellcasting?
//let spells: String?
