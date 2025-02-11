//
//  MonsterStruct.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import Foundation

//struct MonsterStruct: Decodable, Identifiable {
//  let id = UUID()
//  let name: String
//  let size: String?
//  let type: String?
//  let subtype: String?
//  let alignment: String?
//  let armorClass: Int?
//  let hitPoints: Int?
//  let hitDice: String?
//  let speed: Speed?
//  
//  let strength: Int?
//  let dexterity: Int?
//  let constitution: Int?
//  let intelligence: Int?
//  let wisdom: Int?
//  let charisma: Int?
//  
//  let strengthSave: Int?
//  let dexteritySave: Int?
//  let constitutionSave: Int?
//  let intelligenceSave: Int?
//  let wisdomSave: Int?
//  let charismaSave: Int?
//  let skills: [String: SkillValue]?
//  let challengeRating: String?
//  
//  let actions: [Action]?
//  let legendaryActions: [Action]?
//  let specialAbilities: [SpecialAbility]?
//  
//  enum CodingKeys: String, CodingKey {
//    case name, size, type, subtype, alignment
//    case armorClass = "armor_class"
//    case hitPoints = "hit_points"
//    case hitDice = "hit_dice"
//    case speed
//    case strength, dexterity, constitution
//    case intelligence, wisdom, charisma
//    case strengthSave = "strength_save"
//    case dexteritySave = "dexterity_save"
//    case constitutionSave = "constitution_save"
//    case intelligenceSave = "intelligence_save"
//    case wisdomSave = "wisdom_save"
//    case charismaSave = "charisma_save"
//    case skills, actions, legendaryActions = "legendary_actions"
//    case challengeRating = "challenge_rating"
//    case specialAbilities = "special_abilities"
//  }
//}
//
//struct Action: Decodable {
//  let name: String
//  let description: String?
//}
//
//struct SpecialAbility: Decodable {
//  let name: String
//  let description: String?
//}
//
//struct MonsterResponse: Decodable {
//  let count: Int
//  let results: [MonsterStruct]
//}
//
//struct Speed: Decodable {
//  let values: [String: String]
//  
//  init(from decoder: Decoder) throws {
//    let container = try decoder.singleValueContainer()
//    
//    if let dictionary = try? container.decode([String: SpeedValue].self) {
//      self.values = dictionary.mapValues { $0.asString }
//    } else {
//      throw DecodingError.typeMismatch(
//        [String: String].self,
//        DecodingError.Context(
//          codingPath: decoder.codingPath,
//          debugDescription: "Expected a dictionary with String, Int, or Bool values."
//        )
//      )
//    }
//  }
//}
//
//enum SpeedValue: Decodable {
//  case int(Int)
//  case string(String)
//  case bool(Bool)
//  
//  var asString: String {
//    switch self {
//    case .int(let value):
//      return "\(value) ft."
//    case .string(let value):
//      return value
//    case .bool(let value):
//      return value ? "Yes" : "No"
//    }
//  }
//  
//  init(from decoder: Decoder) throws {
//    let container = try decoder.singleValueContainer()
//    
//    if let intValue = try? container.decode(Int.self) {
//      self = .int(intValue)
//    } else if let stringValue = try? container.decode(String.self) {
//      self = .string(stringValue)
//    } else if let boolValue = try? container.decode(Bool.self) {
//      self = .bool(boolValue)
//    } else {
//      throw DecodingError.typeMismatch(
//        String.self,
//        DecodingError.Context(
//          codingPath: decoder.codingPath,
//          debugDescription: "Expected a string, integer, or boolean."
//        )
//      )
//    }
//  }
//}
//
//struct SkillValue: Decodable {
//  let value: String
//  
//  init(from decoder: Decoder) throws {
//    let container = try decoder.singleValueContainer()
//    if let intValue = try? container.decode(Int.self) {
//      self.value = String(intValue)
//    } else if let stringValue = try? container.decode(String.self) {
//      self.value = stringValue
//    } else {
//      throw DecodingError.typeMismatch(
//        String.self,
//        DecodingError.Context(
//          codingPath: decoder.codingPath,
//          debugDescription: "Expected a string or an integer."
//        )
//      )
//    }
//  }
//}
