//
//  MultyTextView.swift
//  SmartPlincoRoll
//
//  Created by Nikita Kuznetsov on 08.08.2024.
//

import SwiftUI

struct MultyTextView: View {
  let string: String
  let textSize: CGFloat
  let textColor: Color
  let isBold: Bool
  let font: FontData
  let textAlignment: TextAlignment
  let shadows: Bool
  let shadowsColor: Color
  let weight: FontWeight
  
  init(string: String, textSize: CGFloat, textColor: Color, isBold: Bool = true, font: FontData, textAlignment: TextAlignment = .center, shadows: Bool = false, shadowColor: Color = .black, weight: FontWeight) {
    self.string = string
    self.textSize = textSize
    self.textColor = textColor
    self.isBold = isBold
    self.font = font
    self.textAlignment = textAlignment
    self.shadows = shadows
    self.shadowsColor = shadowColor
    self.weight = weight
  }
  
  var body: some View {
    Text(string)
      .font(
        Font.custom(font.rawValue, size: textSize)
          .weight(weight.fontWeight)
      )
      .multilineTextAlignment(textAlignment)
      .minimumScaleFactor(0.5)
      .foregroundColor(textColor)
      .shadow(color: shadowsColor, radius: shadows ? 2 : 0, x: shadows ? 2 : 0, y: shadows ? 2 : 0)
  }
}

#Preview {
  MultyTextView(string: "dvoika", textSize: 20, textColor: .white, font: .medium, textAlignment: .center, weight: .light)
}

enum FontData: String {
  case medium = "Medium"
}

enum FontWeight {
  case light
  case bold
  case regular
  case medium
  case semibold
  
  var fontWeight: Font.Weight {
    switch self {
    case .light:
      return .light
    case .bold:
      return .bold
    case .regular:
      return .regular
    case .medium:
      return .medium
    case .semibold:
      return .semibold
    }
  }
}
