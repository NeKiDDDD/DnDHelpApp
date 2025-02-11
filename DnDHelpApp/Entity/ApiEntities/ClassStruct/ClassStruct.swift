//
//  ClassStruct.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI

struct ClassesResponse: Decodable {
  let count: Int
  let results: [SimpleClass]
}

struct SimpleClass: Identifiable, Decodable {
    var id: String { index }
    let index: String
    let name: String
    let url: String
}

//struct DndClass: Identifiable, Decodable {
//  let id = UUID()
//  let name: String
//  let slug: String?
//  let description: String?
//  let hitDice: String?
//  let hpAtFirstLevel: String?
//  let hpAtHigherLevels: String?
//  let profArmor: String?
//  let profWeapons: String?
//  let profTools: String?
//  let profSavingThrows: String?
//  let profSkills: String?
//  let equipment: String?
//  let table: String?
//  let subtypesName: String?
//  let archetypes: [Archetype]?
//  let spellcastingAbility: String?
//  let documentSlug: String?
//  let documentTitle: String?
//  let documentLicenseUrl: String?
//  let documentUrl: String?
//}
//
//struct Archetype: Identifiable, Decodable {
//  let id = UUID()
//  let name: String
//  let slug: String
//  let description: String?
//  let documentSlug: String?
//  let documentTitle: String?
//  let documentLicenseUrl: String?
//  let documentUrl: String?
//}
//
//extension DndClass {
//  enum CodingKeys: String, CodingKey {
//    case name, slug, description = "desc"
//    case hitDice = "hit_dice"
//    case hpAtFirstLevel = "hp_at_1st_level"
//    case hpAtHigherLevels = "hp_at_higher_levels"
//    case profArmor = "prof_armor"
//    case profWeapons = "prof_weapons"
//    case profTools = "prof_tools"
//    case profSavingThrows = "prof_saving_throws"
//    case profSkills = "prof_skills"
//    case equipment, table
//    case subtypesName = "subtypes_name"
//    case archetypes, spellcastingAbility = "spellcasting_ability"
//    case documentSlug = "document__slug"
//    case documentTitle = "document__title"
//    case documentLicenseUrl = "document__license_url"
//    case documentUrl = "document__url"
//  }
//}
//
//extension Archetype {
//  enum CodingKeys: String, CodingKey {
//    case name, slug, description
//    case documentSlug = "document__slug"
//    case documentTitle = "document__title"
//    case documentLicenseUrl = "document__license_url"
//    case documentUrl = "document__url"
//  }
//}

//class Class: Codable, Sendable {
//    let index, name: String
//    let hitDie: Int
//    let proficiencyChoices: [ProficiencyChoice]
//    let proficiencies, savingThrows: [Proficiency]
//    let startingEquipment: [StartingEquipment]
//    let startingEquipmentOptions: [StartingEquipmentOption]
//    let classLevels: String
//    let multiClassing: MultiClassing
//    let subclasses: [Proficiency]
//    let url: String
//    let spellcasting: Spellcasting?
//    let spells: String?
//
//    enum CodingKeys: String, CodingKey {
//        case index, name
//        case hitDie = "hit_die"
//        case proficiencyChoices = "proficiency_choices"
//        case proficiencies
//        case savingThrows = "saving_throws"
//        case startingEquipment = "starting_equipment"
//        case startingEquipmentOptions = "starting_equipment_options"
//        case classLevels = "class_levels"
//        case multiClassing = "multi_classing"
//        case subclasses, url, spellcasting, spells
//    }
//
//    init(index: String, name: String, hitDie: Int, proficiencyChoices: [ProficiencyChoice], proficiencies: [Proficiency], savingThrows: [Proficiency], startingEquipment: [StartingEquipment], startingEquipmentOptions: [StartingEquipmentOption], classLevels: String, multiClassing: MultiClassing, subclasses: [Proficiency], url: String, spellcasting: Spellcasting?, spells: String?) {
//        self.index = index
//        self.name = name
//        self.hitDie = hitDie
//        self.proficiencyChoices = proficiencyChoices
//        self.proficiencies = proficiencies
//        self.savingThrows = savingThrows
//        self.startingEquipment = startingEquipment
//        self.startingEquipmentOptions = startingEquipmentOptions
//        self.classLevels = classLevels
//        self.multiClassing = multiClassing
//        self.subclasses = subclasses
//        self.url = url
//        self.spellcasting = spellcasting
//        self.spells = spells
//    }
//}
//
//// MARK: - MultiClassing
//class MultiClassing: Codable, Sendable {
//    let prerequisites: [MultiClassingPrerequisite]?
//    let proficiencies: [Proficiency]
//    let proficiencyChoices: [ProficiencyChoiceElement]?
//    let prerequisiteOptions: PrerequisiteOptions?
//
//    enum CodingKeys: String, CodingKey {
//        case prerequisites, proficiencies
//        case proficiencyChoices = "proficiency_choices"
//        case prerequisiteOptions = "prerequisite_options"
//    }
//
//    init(prerequisites: [MultiClassingPrerequisite]?, proficiencies: [Proficiency], proficiencyChoices: [ProficiencyChoiceElement]?, prerequisiteOptions: PrerequisiteOptions?) {
//        self.prerequisites = prerequisites
//        self.proficiencies = proficiencies
//        self.proficiencyChoices = proficiencyChoices
//        self.prerequisiteOptions = prerequisiteOptions
//    }
//}
//
//// MARK: - PrerequisiteOptions
//class PrerequisiteOptions: Codable, Sendable {
//    let type: String
//    let choose: Int
//    let from: PrerequisiteOptionsFrom
//
//    init(type: String, choose: Int, from: PrerequisiteOptionsFrom) {
//        self.type = type
//        self.choose = choose
//        self.from = from
//    }
//}
//
//// MARK: - PrerequisiteOptionsFrom
//class PrerequisiteOptionsFrom: Codable, Sendable {
//    let optionSetType: OptionSetType
//    let options: [PurpleOption]
//
//    enum CodingKeys: String, CodingKey {
//        case optionSetType = "option_set_type"
//        case options
//    }
//
//    init(optionSetType: OptionSetType, options: [PurpleOption]) {
//        self.optionSetType = optionSetType
//        self.options = options
//    }
//}
//
//enum OptionSetType: String, Codable, Sendable {
//    case equipmentCategory = "equipment_category"
//    case optionsArray = "options_array"
//}
//
//// MARK: - PurpleOption
//class PurpleOption: Codable, Sendable {
//    let optionType: String
//    let abilityScore: Proficiency
//    let minimumScore: Int
//
//    enum CodingKeys: String, CodingKey {
//        case optionType = "option_type"
//        case abilityScore = "ability_score"
//        case minimumScore = "minimum_score"
//    }
//
//    init(optionType: String, abilityScore: Proficiency, minimumScore: Int) {
//        self.optionType = optionType
//        self.abilityScore = abilityScore
//        self.minimumScore = minimumScore
//    }
//}
//
//// MARK: - Proficiency
//class Proficiency: Codable, Sendable {
//    let index, name, url: String
//
//    init(index: String, name: String, url: String) {
//        self.index = index
//        self.name = name
//        self.url = url
//    }
//}
//
//// MARK: - MultiClassingPrerequisite
//class MultiClassingPrerequisite: Codable, Sendable {
//    let abilityScore: Proficiency
//    let minimumScore: Int
//
//    enum CodingKeys: String, CodingKey {
//        case abilityScore = "ability_score"
//        case minimumScore = "minimum_score"
//    }
//
//    init(abilityScore: Proficiency, minimumScore: Int) {
//        self.abilityScore = abilityScore
//        self.minimumScore = minimumScore
//    }
//}
//
//// MARK: - ProficiencyChoiceElement
//class ProficiencyChoiceElement: Codable, Sendable {
//    let desc: String?
//    let choose: Int
//    let type: ProficiencyChoiceType
//    let from: PurpleFrom
//
//    init(desc: String?, choose: Int, type: ProficiencyChoiceType, from: PurpleFrom) {
//        self.desc = desc
//        self.choose = choose
//        self.type = type
//        self.from = from
//    }
//}
//
//// MARK: - PurpleFrom
//class PurpleFrom: Codable, Sendable {
//    let optionSetType: OptionSetType
//    let options: [FluffyOption]
//
//    enum CodingKeys: String, CodingKey {
//        case optionSetType = "option_set_type"
//        case options
//    }
//
//    init(optionSetType: OptionSetType, options: [FluffyOption]) {
//        self.optionSetType = optionSetType
//        self.options = options
//    }
//}
//
//// MARK: - FluffyOption
//class FluffyOption: Codable, Sendable {
//    let optionType: PurpleOptionType
//    let item: Proficiency
//
//    enum CodingKeys: String, CodingKey {
//        case optionType = "option_type"
//        case item
//    }
//
//    init(optionType: PurpleOptionType, item: Proficiency) {
//        self.optionType = optionType
//        self.item = item
//    }
//}
//
//enum PurpleOptionType: String, Codable, Sendable {
//    case choice = "choice"
//    case reference = "reference"
//}
//
//enum ProficiencyChoiceType: String, Codable, Sendable {
//    case proficiencies = "proficiencies"
//}
//
//// MARK: - ProficiencyChoice
//class ProficiencyChoice: Codable, Sendable {
//    let desc: String
//    let choose: Int
//    let type: ProficiencyChoiceType
//    let from: FluffyFrom
//
//    init(desc: String, choose: Int, type: ProficiencyChoiceType, from: FluffyFrom) {
//        self.desc = desc
//        self.choose = choose
//        self.type = type
//        self.from = from
//    }
//}
//
//// MARK: - FluffyFrom
//class FluffyFrom: Codable, Sendable {
//    let optionSetType: OptionSetType
//    let options: [TentacledOption]
//
//    enum CodingKeys: String, CodingKey {
//        case optionSetType = "option_set_type"
//        case options
//    }
//
//    init(optionSetType: OptionSetType, options: [TentacledOption]) {
//        self.optionSetType = optionSetType
//        self.options = options
//    }
//}
//
//// MARK: - TentacledOption
//class TentacledOption: Codable, Sendable {
//    let optionType: PurpleOptionType
//    let item: Proficiency?
//    let choice: ProficiencyChoiceElement?
//
//    enum CodingKeys: String, CodingKey {
//        case optionType = "option_type"
//        case item, choice
//    }
//
//    init(optionType: PurpleOptionType, item: Proficiency?, choice: ProficiencyChoiceElement?) {
//        self.optionType = optionType
//        self.item = item
//        self.choice = choice
//    }
//}
//
//// MARK: - Spellcasting
//class Spellcasting: Codable, Sendable {
//    let level: Int
//    let spellcastingAbility: Proficiency
//    let info: [Info]
//
//    enum CodingKeys: String, CodingKey {
//        case level
//        case spellcastingAbility = "spellcasting_ability"
//        case info
//    }
//
//    init(level: Int, spellcastingAbility: Proficiency, info: [Info]) {
//        self.level = level
//        self.spellcastingAbility = spellcastingAbility
//        self.info = info
//    }
//}
//
//// MARK: - Info
//class Info: Codable, Sendable {
//    let name: String
//    let desc: [String]
//
//    init(name: String, desc: [String]) {
//        self.name = name
//        self.desc = desc
//    }
//}
//
//// MARK: - StartingEquipment
//class StartingEquipment: Codable, Sendable {
//    let equipment: Proficiency
//    let quantity: Int
//
//    init(equipment: Proficiency, quantity: Int) {
//        self.equipment = equipment
//        self.quantity = quantity
//    }
//}
//
//// MARK: - StartingEquipmentOption
//class StartingEquipmentOption: Codable, Sendable {
//    let desc: String
//    let choose: Int
//    let type: StartingEquipmentOptionType
//    let from: StartingEquipmentOptionFrom
//
//    init(desc: String, choose: Int, type: StartingEquipmentOptionType, from: StartingEquipmentOptionFrom) {
//        self.desc = desc
//        self.choose = choose
//        self.type = type
//        self.from = from
//    }
//}
//
//// MARK: - StartingEquipmentOptionFrom
//class StartingEquipmentOptionFrom: Codable, Sendable {
//    let optionSetType: OptionSetType
//    let options: [StickyOption]?
//    let equipmentCategory: Proficiency?
//
//    enum CodingKeys: String, CodingKey {
//        case optionSetType = "option_set_type"
//        case options
//        case equipmentCategory = "equipment_category"
//    }
//
//    init(optionSetType: OptionSetType, options: [StickyOption]?, equipmentCategory: Proficiency?) {
//        self.optionSetType = optionSetType
//        self.options = options
//        self.equipmentCategory = equipmentCategory
//    }
//}
//
//// MARK: - StickyOption
//class StickyOption: Codable, Sendable {
//    let optionType: ItemOptionType
//    let count: Int?
//    let of: Proficiency?
//    let choice: ItemChoice?
//    let prerequisites: [OptionPrerequisite]?
//    let items: [Item]?
//
//    enum CodingKeys: String, CodingKey {
//        case optionType = "option_type"
//        case count, of, choice, prerequisites, items
//    }
//
//    init(optionType: ItemOptionType, count: Int?, of: Proficiency?, choice: ItemChoice?, prerequisites: [OptionPrerequisite]?, items: [Item]?) {
//        self.optionType = optionType
//        self.count = count
//        self.of = of
//        self.choice = choice
//        self.prerequisites = prerequisites
//        self.items = items
//    }
//}
//
//// MARK: - ItemChoice
//class ItemChoice: Codable, Sendable {
//    let desc: String
//    let choose: Int
//    let type: StartingEquipmentOptionType
//    let from: TentacledFrom
//
//    init(desc: String, choose: Int, type: StartingEquipmentOptionType, from: TentacledFrom) {
//        self.desc = desc
//        self.choose = choose
//        self.type = type
//        self.from = from
//    }
//}
//
//// MARK: - TentacledFrom
//class TentacledFrom: Codable, Sendable {
//    let optionSetType: OptionSetType
//    let equipmentCategory: Proficiency
//
//    enum CodingKeys: String, CodingKey {
//        case optionSetType = "option_set_type"
//        case equipmentCategory = "equipment_category"
//    }
//
//    init(optionSetType: OptionSetType, equipmentCategory: Proficiency) {
//        self.optionSetType = optionSetType
//        self.equipmentCategory = equipmentCategory
//    }
//}
//
//enum StartingEquipmentOptionType: String, Codable, Sendable {
//    case equipment = "equipment"
//}
//
//// MARK: - Item
//class Item: Codable, Sendable {
//    let optionType: ItemOptionType
//    let count: Int?
//    let of: Proficiency?
//    let choice: ItemChoice?
//
//    enum CodingKeys: String, CodingKey {
//        case optionType = "option_type"
//        case count, of, choice
//    }
//
//    init(optionType: ItemOptionType, count: Int?, of: Proficiency?, choice: ItemChoice?) {
//        self.optionType = optionType
//        self.count = count
//        self.of = of
//        self.choice = choice
//    }
//}
//
//enum ItemOptionType: String, Codable, Sendable {
//    case choice = "choice"
//    case countedReference = "counted_reference"
//    case multiple = "multiple"
//}
//
//// MARK: - OptionPrerequisite
//class OptionPrerequisite: Codable, Sendable {
//    let type: String
//    let proficiency: Proficiency
//
//    init(type: String, proficiency: Proficiency) {
//        self.type = type
//        self.proficiency = proficiency
//    }
//}
//
//typealias Classes = [Class]
