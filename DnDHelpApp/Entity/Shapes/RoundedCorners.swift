//
//  RoundedCorners.swift
//  ZodiacApp
//
//  Created by Nikita Kuznetsov on 11.10.2024.
//

import SwiftUI

struct RoundedCorners: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  var animatableData: CGFloat {
    get { radius }
    set { radius = newValue }
  }
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect,
                            byRoundingCorners: corners,
                            cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}
