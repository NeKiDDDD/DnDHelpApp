//
//  MonstersView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct MonstersView: View {
  @State private var service = Open5eService()
  @State private var isLoading = false
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVStack {
          ForEach(service.monsters.indices, id: \.self) { index in
            let monster = service.monsters[index]
            NavigationLink(destination: MonsterDetailView(monster: monster)) {
              OneMonsterCellView(monster: monster)
            }
            .buttonStyle(PlainButtonStyle())
            .onAppear {
              if index == service.monsters.count - 1 {
                loadMoreIfNeeded()
              }
            }
          }
          if isLoading {
            ProgressView()
              .padding()
          }
        }
      }
      .navigationTitle("Monsters")
      .onAppear {
        service.fetchMonsters()
      }
      .onAppear(perform: loadMoreIfNeeded)
    }
  }
  
  private func loadMoreIfNeeded() {
    guard !isLoading, service.hasMoreMonsters else { return }
    isLoading = true
    service.fetchMoreMonsters { success in
      isLoading = false
    }
  }
}

#Preview {
  MonstersView()
}
