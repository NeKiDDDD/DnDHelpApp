//
//  ButtonStruct.swift
//  SmartPlincoRoll
//
//  Created by Nikita Kuznetsov on 09.08.2024.
//

import SwiftUI

struct ButtonView: View {
  let type: ButtonType
  let action: () -> Void
  
  var body: some View {
    Button(action: userInteraction) {
      contentView
    }
  }
  
  @ViewBuilder
  private var contentView: some View {
    switch type {
    case .ready(let imageName):
      Image(imageName.rawValue)
    case .justText(let text):
      MultyTextView(string: text, textSize: 32, textColor: .white, font: .medium, weight: .regular)
    case .levelButton(let levelName):
      ZStack {
        Rectangle()
          .stroke(Color.black, lineWidth: 3)
          .frame(width: 240, height: 52)
          .background(
            Color.white
              .opacity(0.8)
          )
        MultyTextView(string: levelName, textSize: 24, textColor: .white, font: .medium, shadows: true, shadowColor: .black , weight: .regular)
      }
    }
  }
  
  private func userInteraction() {
    action()
  }
}

#Preview {
  ButtonView(type: .ready(.playButton), action: {})
}

enum ButtonType {
  case ready(ReadyButton)
  case justText(String)
  case levelButton(String)
}

enum ReadyButton: String {
  case askButton = "askButton"
  case backButton = "backButton"
  case settingsButton = "settingsButton"
  case xButton = "xButton"
  case musicOff = "musicOff"
  case musicOn = "musicOn"
  case menuButton = "menuButton"
  case soundOff = "soundOff"
  case soundOn = "soundOn"
  case repeatButton = "repeatButton"
  case getButton = "getButton"
  case noButton = "noButton"
  case playButton = "playButton"
  case pauseButton = "pauseButton"
  case leaderButton = "leaderButton"
}
