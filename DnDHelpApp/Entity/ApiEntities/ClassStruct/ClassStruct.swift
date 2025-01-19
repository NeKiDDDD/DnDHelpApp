//
//  ClassStruct.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct ClassResponse: Decodable {
  let results: [DndClass]
}

struct DndClass: Identifiable, Decodable {
  let id = UUID()
  let name: String
  let slug: String
  let description: String?
  let hitDice: String?
  let hpAtFirstLevel: String?
  let hpAtHigherLevels: String?
  let profArmor: String?
  let profWeapons: String?
  let profTools: String?
  let profSavingThrows: String?
  let profSkills: String?
  let equipment: String?
  let table: String?
  let subtypesName: String?
  let archetypes: [Archetype]?
  let spellcastingAbility: String?
  let documentSlug: String?
  let documentTitle: String?
  let documentLicenseUrl: String?
  let documentUrl: String?
}

struct Archetype: Identifiable, Decodable {
  let id = UUID()
  let name: String
  let slug: String
  let description: String?
  let documentSlug: String?
  let documentTitle: String?
  let documentLicenseUrl: String?
  let documentUrl: String?
}

extension DndClass {
  enum CodingKeys: String, CodingKey {
    case name, slug, description = "desc"
    case hitDice = "hit_dice"
    case hpAtFirstLevel = "hp_at_1st_level"
    case hpAtHigherLevels = "hp_at_higher_levels"
    case profArmor = "prof_armor"
    case profWeapons = "prof_weapons"
    case profTools = "prof_tools"
    case profSavingThrows = "prof_saving_throws"
    case profSkills = "prof_skills"
    case equipment, table
    case subtypesName = "subtypes_name"
    case archetypes, spellcastingAbility = "spellcasting_ability"
    case documentSlug = "document__slug"
    case documentTitle = "document__title"
    case documentLicenseUrl = "document__license_url"
    case documentUrl = "document__url"
  }
}

extension Archetype {
  enum CodingKeys: String, CodingKey {
    case name, slug, description
    case documentSlug = "document__slug"
    case documentTitle = "document__title"
    case documentLicenseUrl = "document__license_url"
    case documentUrl = "document__url"
  }
}
