//
//  OneMonsterCellView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct OneMonsterCellView: View {
  let monster: Monster
  
  var body: some View {
    HStack {
//      Text(monster.name)
      Spacer()
//      if let challengeRate = monster.challengeRating {
//        Text("Challenge Rating: \(challengeRate)")
//          .font(.subheadline)
//          .foregroundColor(.secondary)
//      }
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
//  OneMonsterCellView()
//}
