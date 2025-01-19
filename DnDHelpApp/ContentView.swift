//
//  ContentView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 23.07.2024.
//

import SwiftUI

struct ContentView: View {
  @State var isShowingSideView: Bool = true
  
  var body: some View {
    NavigationStack {
      ZStack {
        VStack {
          HStack {
            Spacer()
            Button(action: { withAnimation(.easeInOut) { isShowingSideView.toggle() }}) {
              Image(systemName: "plus")
            }
          }
          Spacer()
        }
        .padding()
        HStack {
          SideView()
            .frame(width: 200, alignment: .leading)
            .background(
              RoundedCorners(radius: 24, corners: [.topRight, .bottomRight])
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
            )
            .overlay(
              RoundedCorners(radius: 24, corners: [.topRight, .bottomRight])
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .offset(x: isShowingSideView ? -500 : 0)
          //                    .ignoresSafeArea()
          Spacer()
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
