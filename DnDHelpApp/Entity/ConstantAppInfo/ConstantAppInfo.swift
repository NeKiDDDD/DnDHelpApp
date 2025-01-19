//
//  ConstantAppInfo.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 24.08.2024.
//

import SwiftUI

struct ConstantAppInfo {
  
  enum LibrarySection: CaseIterable {
    case spells
    case classes
    case races
    case magicItems
    case bestiary
    case traits
    case background
    case gameRules
    case items
    case transport
    case mysterious
    case infuses
    case gods
    case languages
    
    var buttonDescriprion: String {
      switch self {
      case .spells :
        return "Заклинания"
      case .classes:
        return "Классы"
      case .races:
        return "Расы"
      case .magicItems:
        return "Магические предметы"
      case .bestiary:
        return "Бестиарий"
      case .traits:
        return "Черты"
      case .background:
        return "Предыстория"
      case .gameRules:
        return "Игровые правила"
      case .items:
        return "Каталог снаряжения"
      case .transport:
        return "Транспорт"
      case .mysterious:
        return "Таинственные воззвания"
      case .infuses:
        return "Инфузии изобретателя"
      case .gods:
        return "Боги"
      case .languages:
        return "Языки"
      }
    }
  }
  
  enum CharacterSection: CaseIterable {
    case character
    case charCreator
    case charCollection
    case charRandom
    
    var buttonDescriprion: String {
      switch self {
      case .character:
        return "Персонаж"
      case .charCreator:
        return "Создание персонажа"
      case .charCollection:
        return "Каталог персонажей"
      case .charRandom:
        return "Генерация случайного персонажа"
      }
    }
  }
  
  enum GeneratorSection: CaseIterable {
    case cubesGenerator
    case charGenerator
    
    var buttonDescriprion: String {
      switch self {
      case .cubesGenerator:
        return "Кубы"
      case .charGenerator:
        return "Генерация случайного персонажа?"
      }
    }
  }
}
