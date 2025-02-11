//
//  SpellStruct.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 14.10.2024.
//

import Foundation

//struct SpellStruct: Decodable, Identifiable {
//  let id = UUID()
//  let name: String
//  let key: String
//  let url: String
//  let castingOptions: [CastingOption]
//  let school: School
//  let rangeUnit: String?
//  let shapeSizeUnit: String?
//  let desc: String
//  let level: Int
//  let higherLevel: String?
//  let targetType: String?
//  let rangeText: String?
//  let range: Double?
//  let ritual: Bool
//  let castingTime: String
//  let reactionCondition: String?
//  let verbal: Bool
//  let somatic: Bool
//  let material: Bool
//  let materialSpecified: String?
//  let materialCost: Int?
//  let materialConsumed: Bool
//  let targetCount: Int?
//  let savingThrowAbility: String?
//  let attackRoll: Bool
//  let damageRoll: String?
//  let damageTypes: [String]
//  let duration: String
//  let shapeType: String?
//  let shapeSize: Int?
//  let concentration: Bool
//  let document: String
//  let classes: [String]
//}
//
//struct CastingOption: Decodable {
//  let type: String
//  let damageRoll: String?
//  let targetCount: Int?
//  let duration: String?
//  let range: Double?
//}
//
////struct School: Decodable {
////  let key: String
////  let name: String
////  let desc: String
////  let document: String
////}
//
//extension SpellStruct {
//  enum CodingKeys: String, CodingKey {
//    case key, url, school, name, desc, level, ritual, material
//    case castingOptions = "casting_options"
//    case rangeUnit = "range_unit"
//    case shapeSizeUnit = "shape_size_unit"
//    case higherLevel = "higher_level"
//    case targetType = "target_type"
//    case rangeText = "range_text"
//    case range
//    case castingTime = "casting_time"
//    case reactionCondition = "reaction_condition"
//    case verbal, somatic, materialSpecified = "material_specified"
//    case materialCost = "material_cost"
//    case materialConsumed = "material_consumed"
//    case targetCount = "target_count"
//    case savingThrowAbility = "saving_throw_ability"
//    case attackRoll = "attack_roll"
//    case damageRoll = "damage_roll"
//    case damageTypes = "damage_types"
//    case duration
//    case shapeType = "shape_type"
//    case shapeSize = "shape_size"
//    case concentration
//    case document, classes
//  }
//}
