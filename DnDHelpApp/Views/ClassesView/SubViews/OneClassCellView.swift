//
//  OneClassCellView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct OneClassCellView: View {
  let oneClass: DndClass
  
  var body: some View {
    HStack {
      VStack {
        HStack {
          Text(oneClass.name)
            .font(.headline)
          Spacer()
        }
        HStack {
          if let hitDice = oneClass.hitDice {
            Text("Hit Dice: \(hitDice)")
              .font(.subheadline)
              .foregroundColor(.secondary)
          }
          Spacer()
        }
      }
      Spacer()
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 24)
        .stroke(Color.gray.opacity(0.1), lineWidth: 1)
        .fill(
          Color.white.opacity(0.1)
        )
        .shadow(radius: 5, x: 0, y: 10)
    )
    .frame(width: .infinity)
    .padding()
  }
}

//#Preview {
//  OneClassCellView()
//}
