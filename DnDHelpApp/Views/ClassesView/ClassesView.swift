//
//  ClassesView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct ClassesView: View {
  @State private var service = Open5eService()
  
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        ForEach(service.classes, id: \.index) { className in
          NavigationLink(destination: ClassDetailView(endpoint: className.url)) {
              OneClassCellView(oneClass: className)
          }
          .buttonStyle(.plain)
        }
      }
      .navigationTitle("D&D Classes")
      .onAppear {
        service.fetchClasses()
      }
    }
  }
}

#Preview {
  ClassesView()
}
