//
//  FullData.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 11.02.2025.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let abilityScores = try? JSONDecoder().decode(AbilityScores.self, from: jsonData)
//   let alignments = try? JSONDecoder().decode(Alignments.self, from: jsonData)
//   let backgrounds = try? JSONDecoder().decode(Backgrounds.self, from: jsonData)
//   let classes = try? JSONDecoder().decode(Classes.self, from: jsonData)
//   let conditions = try? JSONDecoder().decode(Conditions.self, from: jsonData)
//   let damageTypes = try? JSONDecoder().decode(DamageTypes.self, from: jsonData)
//   let equipmentCategories = try? JSONDecoder().decode(EquipmentCategories.self, from: jsonData)
//   let equipment = try? JSONDecoder().decode(Equipment.self, from: jsonData)
//   let feats = try? JSONDecoder().decode(Feats.self, from: jsonData)
//   let features = try? JSONDecoder().decode(Features.self, from: jsonData)
//   let languages = try? JSONDecoder().decode(Languages.self, from: jsonData)
//   let levels = try? JSONDecoder().decode(Levels.self, from: jsonData)
//   let magicItems = try? JSONDecoder().decode(MagicItems.self, from: jsonData)
//   let magicSchools = try? JSONDecoder().decode(MagicSchools.self, from: jsonData)
//   let monsters = try? JSONDecoder().decode(Monsters.self, from: jsonData)
//   let proficiencies = try? JSONDecoder().decode(Proficiencies.self, from: jsonData)
//   let races = try? JSONDecoder().decode(Races.self, from: jsonData)
//   let ruleSections = try? JSONDecoder().decode(RuleSections.self, from: jsonData)
//   let rules = try? JSONDecoder().decode(Rules.self, from: jsonData)
//   let skills = try? JSONDecoder().decode(Skills.self, from: jsonData)
//   let spells = try? JSONDecoder().decode(Spells.self, from: jsonData)
//   let subclasses = try? JSONDecoder().decode(Subclasses.self, from: jsonData)
//   let subraces = try? JSONDecoder().decode(Subraces.self, from: jsonData)
//   let traits = try? JSONDecoder().decode(Traits.self, from: jsonData)
//   let weaponProperties = try? JSONDecoder().decode(WeaponProperties.self, from: jsonData)

import Foundation

// MARK: - AbilityScore
class AbilityScore: Codable {
  let index, name, fullName: String?
  let desc: [String]?
  let skills: [Condition]?
  let url: String?
  
  enum CodingKeys: String, CodingKey {
    case index, name
    case fullName = "full_name"
    case desc, skills, url
  }
  
  init(index: String?, name: String?, fullName: String?, desc: [String]?, skills: [Condition]?, url: String?) {
    self.index = index
    self.name = name
    self.fullName = fullName
    self.desc = desc
    self.skills = skills
    self.url = url
  }
}

// MARK: - ConditionPrerequisite
class ConditionPrerequisite: Codable {
  let abilityScore: Condition?
  let minimumScore: Int?
  
  enum CodingKeys: String, CodingKey {
    case abilityScore = "ability_score"
    case minimumScore = "minimum_score"
  }
  
  init(abilityScore: Condition?, minimumScore: Int?) {
    self.abilityScore = abilityScore
    self.minimumScore = minimumScore
  }
}

// MARK: - Condition
class Condition: Codable {
  let name, index, url: String?
  let desc: Desc?
  let equipment: [Condition]?
  let prerequisites: [ConditionPrerequisite]?
  let subsections: [Condition]?
  let abilityScore: Condition?
  let type: ConditionType?
  
  enum CodingKeys: String, CodingKey {
    case name, index, url, desc, equipment, prerequisites, subsections
    case abilityScore = "ability_score"
    case type
  }
  
  init(name: String?, index: String?, url: String?, desc: Desc?, equipment: [Condition]?, prerequisites: [ConditionPrerequisite]?, subsections: [Condition]?, abilityScore: Condition?, type: ConditionType?) {
    self.name = name
    self.index = index
    self.url = url
    self.desc = desc
    self.equipment = equipment
    self.prerequisites = prerequisites
    self.subsections = subsections
    self.abilityScore = abilityScore
    self.type = type
  }
}

enum Desc: Codable {
  case string(String)
  case stringArray([String])
  
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let x = try? container.decode([String].self) {
      self = .stringArray(x)
      return
    }
    if let x = try? container.decode(String.self) {
      self = .string(x)
      return
    }
    throw DecodingError.typeMismatch(Desc.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Desc"))
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .string(let x):
      try container.encode(x)
    case .stringArray(let x):
      try container.encode(x)
    }
  }
}

enum ConditionType: String, Codable {
  case feature = "feature"
  case level = "level"
  case spell = "spell"
}

// MARK: - Alignment
class Alignment: Codable {
  let index, name, abbreviation, desc: String?
  let url: String?
  
  init(index: String?, name: String?, abbreviation: String?, desc: String?, url: String?) {
    self.index = index
    self.name = name
    self.abbreviation = abbreviation
    self.desc = desc
    self.url = url
  }
}

// MARK: - Background
class Background: Codable {
  let index, name: String?
  let startingProficiencies: [Condition]?
  let languageOptions: BackgroundLanguageOptions?
  let startingEquipment: [StartingEquipment]?
  let startingEquipmentOptions: [ChoiceElement]?
  let feature: Feature?
  let personalityTraits: Bonds?
  let ideals: Ideals?
  let bonds, flaws: Bonds?
  let url: String?
  
  enum CodingKeys: String, CodingKey {
    case index, name
    case startingProficiencies = "starting_proficiencies"
    case languageOptions = "language_options"
    case startingEquipment = "starting_equipment"
    case startingEquipmentOptions = "starting_equipment_options"
    case feature
    case personalityTraits = "personality_traits"
    case ideals, bonds, flaws, url
  }
  
  init(index: String?, name: String?, startingProficiencies: [Condition]?, languageOptions: BackgroundLanguageOptions?, startingEquipment: [StartingEquipment]?, startingEquipmentOptions: [ChoiceElement]?, feature: Feature?, personalityTraits: Bonds?, ideals: Ideals?, bonds: Bonds?, flaws: Bonds?, url: String?) {
    self.index = index
    self.name = name
    self.startingProficiencies = startingProficiencies
    self.languageOptions = languageOptions
    self.startingEquipment = startingEquipment
    self.startingEquipmentOptions = startingEquipmentOptions
    self.feature = feature
    self.personalityTraits = personalityTraits
    self.ideals = ideals
    self.bonds = bonds
    self.flaws = flaws
    self.url = url
  }
}

// MARK: - Bonds
class Bonds: Codable {
  let choose: Int?
  let type: String?
  let from: BondsFrom?
  
  init(choose: Int?, type: String?, from: BondsFrom?) {
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - BondsFrom
class BondsFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [PurpleOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [PurpleOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

enum OptionSetType: String, Codable {
  case equipmentCategory = "equipment_category"
  case optionsArray = "options_array"
}

// MARK: - PurpleOption
class PurpleOption: Codable {
  let optionType: PurpleOptionType?
  let string: String?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case string
  }
  
  init(optionType: PurpleOptionType?, string: String?) {
    self.optionType = optionType
    self.string = string
  }
}

enum PurpleOptionType: String, Codable {
  case string = "string"
}

// MARK: - Feature
class Feature: Codable {
  let name: String?
  let desc: [String]?
  
  init(name: String?, desc: [String]?) {
    self.name = name
    self.desc = desc
  }
}

// MARK: - Ideals
class Ideals: Codable {
  let choose: Int?
  let type: String?
  let from: IdealsFrom?
  
  init(choose: Int?, type: String?, from: IdealsFrom?) {
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - IdealsFrom
class IdealsFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [FluffyOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [FluffyOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

// MARK: - FluffyOption
class FluffyOption: Codable {
  let optionType, desc: String?
  let alignments: [Condition]?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case desc, alignments
  }
  
  init(optionType: String?, desc: String?, alignments: [Condition]?) {
    self.optionType = optionType
    self.desc = desc
    self.alignments = alignments
  }
}

// MARK: - BackgroundLanguageOptions
class BackgroundLanguageOptions: Codable {
  let choose: Int?
  let type: String?
  let from: PurpleFrom?
  
  init(choose: Int?, type: String?, from: PurpleFrom?) {
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - PurpleFrom
class PurpleFrom: Codable {
  let optionSetType, resourceListURL: String?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case resourceListURL = "resource_list_url"
  }
  
  init(optionSetType: String?, resourceListURL: String?) {
    self.optionSetType = optionSetType
    self.resourceListURL = resourceListURL
  }
}

// MARK: - StartingEquipment
class StartingEquipment: Codable {
  let equipment: Condition?
  let quantity: Int?
  
  init(equipment: Condition?, quantity: Int?) {
    self.equipment = equipment
    self.quantity = quantity
  }
}

// MARK: - ChoiceElement
class ChoiceElement: Codable {
  let choose: Int?
  let type: StartingEquipmentOptionType?
  let from: FluffyFrom?
  let desc: String?
  
  init(choose: Int?, type: StartingEquipmentOptionType?, from: FluffyFrom?, desc: String?) {
    self.choose = choose
    self.type = type
    self.from = from
    self.desc = desc
  }
}

// MARK: - FluffyFrom
class FluffyFrom: Codable {
  let optionSetType: OptionSetType?
  let equipmentCategory: Condition?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case equipmentCategory = "equipment_category"
  }
  
  init(optionSetType: OptionSetType?, equipmentCategory: Condition?) {
    self.optionSetType = optionSetType
    self.equipmentCategory = equipmentCategory
  }
}

enum StartingEquipmentOptionType: String, Codable {
  case equipment = "equipment"
}

// MARK: - Class
class Class: Codable {
  let index, name: String?
  let hitDie: Int?
  let proficiencyChoices: [ProficiencyChoice]?
  let proficiencies, savingThrows: [Condition]?
  let startingEquipment: [StartingEquipment]?
  let startingEquipmentOptions: [ClassStartingEquipmentOption]?
  let classLevels: String?
  let multiClassing: MultiClassing?
  let subclasses: [Condition]?
  let url: String?
  let spellcasting: ClassSpellcasting?
  let spells: String?
  
  enum CodingKeys: String, CodingKey {
    case index, name
    case hitDie = "hit_die"
    case proficiencyChoices = "proficiency_choices"
    case proficiencies
    case savingThrows = "saving_throws"
    case startingEquipment = "starting_equipment"
    case startingEquipmentOptions = "starting_equipment_options"
    case classLevels = "class_levels"
    case multiClassing = "multi_classing"
    case subclasses, url, spellcasting, spells
  }
  
  init(index: String?, name: String?, hitDie: Int?, proficiencyChoices: [ProficiencyChoice]?, proficiencies: [Condition]?, savingThrows: [Condition]?, startingEquipment: [StartingEquipment]?, startingEquipmentOptions: [ClassStartingEquipmentOption]?, classLevels: String?, multiClassing: MultiClassing?, subclasses: [Condition]?, url: String?, spellcasting: ClassSpellcasting?, spells: String?) {
    self.index = index
    self.name = name
    self.hitDie = hitDie
    self.proficiencyChoices = proficiencyChoices
    self.proficiencies = proficiencies
    self.savingThrows = savingThrows
    self.startingEquipment = startingEquipment
    self.startingEquipmentOptions = startingEquipmentOptions
    self.classLevels = classLevels
    self.multiClassing = multiClassing
    self.subclasses = subclasses
    self.url = url
    self.spellcasting = spellcasting
    self.spells = spells
  }
}

// MARK: - MultiClassing
class MultiClassing: Codable {
  let prerequisites: [ConditionPrerequisite]?
  let proficiencies: [Condition]?
  let proficiencyChoices: [LanguageOptionsElement]?
  let prerequisiteOptions: PrerequisiteOptions?
  
  enum CodingKeys: String, CodingKey {
    case prerequisites, proficiencies
    case proficiencyChoices = "proficiency_choices"
    case prerequisiteOptions = "prerequisite_options"
  }
  
  init(prerequisites: [ConditionPrerequisite]?, proficiencies: [Condition]?, proficiencyChoices: [LanguageOptionsElement]?, prerequisiteOptions: PrerequisiteOptions?) {
    self.prerequisites = prerequisites
    self.proficiencies = proficiencies
    self.proficiencyChoices = proficiencyChoices
    self.prerequisiteOptions = prerequisiteOptions
  }
}

// MARK: - PrerequisiteOptions
class PrerequisiteOptions: Codable {
  let type: String?
  let choose: Int?
  let from: PrerequisiteOptionsFrom?
  
  init(type: String?, choose: Int?, from: PrerequisiteOptionsFrom?) {
    self.type = type
    self.choose = choose
    self.from = from
  }
}

// MARK: - PrerequisiteOptionsFrom
class PrerequisiteOptionsFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [TentacledOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [TentacledOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

// MARK: - TentacledOption
class TentacledOption: Codable {
  let optionType: String?
  let abilityScore: Condition?
  let minimumScore: Int?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case abilityScore = "ability_score"
    case minimumScore = "minimum_score"
  }
  
  init(optionType: String?, abilityScore: Condition?, minimumScore: Int?) {
    self.optionType = optionType
    self.abilityScore = abilityScore
    self.minimumScore = minimumScore
  }
}

// MARK: - LanguageOptionsElement
class LanguageOptionsElement: Codable {
  let desc: String?
  let choose: Int?
  let type: String?
  let from: StartingProficiencyOptionsFrom?
  
  init(desc: String?, choose: Int?, type: String?, from: StartingProficiencyOptionsFrom?) {
    self.desc = desc
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - StartingProficiencyOptionsFrom
class StartingProficiencyOptionsFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [StickyOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [StickyOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

// MARK: - StickyOption
class StickyOption: Codable {
  let optionType: FluffyOptionType?
  let item: Condition?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case item
  }
  
  init(optionType: FluffyOptionType?, item: Condition?) {
    self.optionType = optionType
    self.item = item
  }
}

enum FluffyOptionType: String, Codable {
  case choice = "choice"
  case multiple = "multiple"
  case reference = "reference"
}

// MARK: - ProficiencyChoice
class ProficiencyChoice: Codable {
  let desc: String?
  let choose: Int?
  let type: ProficiencyChoiceType?
  let from: TentacledFrom?
  
  init(desc: String?, choose: Int?, type: ProficiencyChoiceType?, from: TentacledFrom?) {
    self.desc = desc
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - TentacledFrom
class TentacledFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [IndigoOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [IndigoOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

// MARK: - IndigoOption
class IndigoOption: Codable {
  let optionType: FluffyOptionType?
  let item: Condition?
  let choice: LanguageOptionsElement?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case item, choice
  }
  
  init(optionType: FluffyOptionType?, item: Condition?, choice: LanguageOptionsElement?) {
    self.optionType = optionType
    self.item = item
    self.choice = choice
  }
}

enum ProficiencyChoiceType: String, Codable {
  case proficiencies = "proficiencies"
}

// MARK: - ClassSpellcasting
class ClassSpellcasting: Codable {
  let level: Int?
  let spellcastingAbility: Condition?
  let info: [Feature]?
  
  enum CodingKeys: String, CodingKey {
    case level
    case spellcastingAbility = "spellcasting_ability"
    case info
  }
  
  init(level: Int?, spellcastingAbility: Condition?, info: [Feature]?) {
    self.level = level
    self.spellcastingAbility = spellcastingAbility
    self.info = info
  }
}

// MARK: - ClassStartingEquipmentOption
class ClassStartingEquipmentOption: Codable {
  let desc: String?
  let choose: Int?
  let type: StartingEquipmentOptionType?
  let from: StickyFrom?
  
  init(desc: String?, choose: Int?, type: StartingEquipmentOptionType?, from: StickyFrom?) {
    self.desc = desc
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - StickyFrom
class StickyFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [IndecentOption]?
  let equipmentCategory: Condition?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
    case equipmentCategory = "equipment_category"
  }
  
  init(optionSetType: OptionSetType?, options: [IndecentOption]?, equipmentCategory: Condition?) {
    self.optionSetType = optionSetType
    self.options = options
    self.equipmentCategory = equipmentCategory
  }
}

// MARK: - IndecentOption
class IndecentOption: Codable {
  let optionType: TentacledOptionType?
  let count: Int?
  let of: Condition?
  let choice: ChoiceElement?
  let prerequisites: [OptionPrerequisite]?
  let items: [Item]?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case count, of, choice, prerequisites, items
  }
  
  init(optionType: TentacledOptionType?, count: Int?, of: Condition?, choice: ChoiceElement?, prerequisites: [OptionPrerequisite]?, items: [Item]?) {
    self.optionType = optionType
    self.count = count
    self.of = of
    self.choice = choice
    self.prerequisites = prerequisites
    self.items = items
  }
}

// MARK: - Item
class Item: Codable {
  let optionType: TentacledOptionType?
  let count: Int?
  let of: Condition?
  let choice: ChoiceElement?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case count, of, choice
  }
  
  init(optionType: TentacledOptionType?, count: Int?, of: Condition?, choice: ChoiceElement?) {
    self.optionType = optionType
    self.count = count
    self.of = of
    self.choice = choice
  }
}

enum TentacledOptionType: String, Codable {
  case choice = "choice"
  case countedReference = "counted_reference"
  case multiple = "multiple"
}

// MARK: - OptionPrerequisite
class OptionPrerequisite: Codable {
  let type: String?
  let proficiency: Condition?
  
  init(type: String?, proficiency: Condition?) {
    self.type = type
    self.proficiency = proficiency
  }
}

// MARK: - EquipmentElement
class EquipmentElement: Codable {
  let index, name: String?
  let equipmentCategory: Condition?
  let weaponCategory: WeaponCategory?
  let weaponRange: WeaponRange?
  let categoryRange: CategoryRange?
  let cost: Cost?
  let damage: TwoHandedDamageElement?
  let range: RangeClass?
  let weight: Double?
  let properties: [Condition]?
  let url: String?
  let throwRange: RangeClass?
  let twoHandedDamage: TwoHandedDamageElement?
  let special: [String]?
  let armorCategory: String?
  let armorClass: EquipmentArmorClass?
  let strMinimum: Int?
  let stealthDisadvantage: Bool?
  let gearCategory: Condition?
  let desc: [String]?
  let quantity: Int?
  let contents: [Content]?
  let toolCategory: ToolCategory?
  let vehicleCategory: VehicleCategory?
  let speed: Cost?
  let capacity: String?
  
  enum CodingKeys: String, CodingKey {
    case index, name
    case equipmentCategory = "equipment_category"
    case weaponCategory = "weapon_category"
    case weaponRange = "weapon_range"
    case categoryRange = "category_range"
    case cost, damage, range, weight, properties, url
    case throwRange = "throw_range"
    case twoHandedDamage = "two_handed_damage"
    case special
    case armorCategory = "armor_category"
    case armorClass = "armor_class"
    case strMinimum = "str_minimum"
    case stealthDisadvantage = "stealth_disadvantage"
    case gearCategory = "gear_category"
    case desc, quantity, contents
    case toolCategory = "tool_category"
    case vehicleCategory = "vehicle_category"
    case speed, capacity
  }
  
  init(index: String?, name: String?, equipmentCategory: Condition?, weaponCategory: WeaponCategory?, weaponRange: WeaponRange?, categoryRange: CategoryRange?, cost: Cost?, damage: TwoHandedDamageElement?, range: RangeClass?, weight: Double?, properties: [Condition]?, url: String?, throwRange: RangeClass?, twoHandedDamage: TwoHandedDamageElement?, special: [String]?, armorCategory: String?, armorClass: EquipmentArmorClass?, strMinimum: Int?, stealthDisadvantage: Bool?, gearCategory: Condition?, desc: [String]?, quantity: Int?, contents: [Content]?, toolCategory: ToolCategory?, vehicleCategory: VehicleCategory?, speed: Cost?, capacity: String?) {
    self.index = index
    self.name = name
    self.equipmentCategory = equipmentCategory
    self.weaponCategory = weaponCategory
    self.weaponRange = weaponRange
    self.categoryRange = categoryRange
    self.cost = cost
    self.damage = damage
    self.range = range
    self.weight = weight
    self.properties = properties
    self.url = url
    self.throwRange = throwRange
    self.twoHandedDamage = twoHandedDamage
    self.special = special
    self.armorCategory = armorCategory
    self.armorClass = armorClass
    self.strMinimum = strMinimum
    self.stealthDisadvantage = stealthDisadvantage
    self.gearCategory = gearCategory
    self.desc = desc
    self.quantity = quantity
    self.contents = contents
    self.toolCategory = toolCategory
    self.vehicleCategory = vehicleCategory
    self.speed = speed
    self.capacity = capacity
  }
}

// MARK: - EquipmentArmorClass
class EquipmentArmorClass: Codable {
  let base: Int?
  let dexBonus: Bool?
  let maxBonus: Int?
  
  enum CodingKeys: String, CodingKey {
    case base
    case dexBonus = "dex_bonus"
    case maxBonus = "max_bonus"
  }
  
  init(base: Int?, dexBonus: Bool?, maxBonus: Int?) {
    self.base = base
    self.dexBonus = dexBonus
    self.maxBonus = maxBonus
  }
}

enum CategoryRange: String, Codable {
  case martialMelee = "Martial Melee"
  case martialRanged = "Martial Ranged"
  case simpleMelee = "Simple Melee"
  case simpleRanged = "Simple Ranged"
}

// MARK: - Content
class Content: Codable {
  let item: Condition?
  let quantity: Int?
  
  init(item: Condition?, quantity: Int?) {
    self.item = item
    self.quantity = quantity
  }
}

// MARK: - Cost
class Cost: Codable {
  let quantity: Double?
  let unit: Unit?
  
  init(quantity: Double?, unit: Unit?) {
    self.quantity = quantity
    self.unit = unit
  }
}

enum Unit: String, Codable {
  case cp = "cp"
  case ftRound = "ft/round"
  case gp = "gp"
  case mph = "mph"
  case sp = "sp"
}

// MARK: - TwoHandedDamageElement
class TwoHandedDamageElement: Codable {
  let damageDice: String?
  let damageType: Condition?
  
  enum CodingKeys: String, CodingKey {
    case damageDice = "damage_dice"
    case damageType = "damage_type"
  }
  
  init(damageDice: String?, damageType: Condition?) {
    self.damageDice = damageDice
    self.damageType = damageType
  }
}

// MARK: - RangeClass
class RangeClass: Codable {
  let normal, long: Int?
  
  init(normal: Int?, long: Int?) {
    self.normal = normal
    self.long = long
  }
}

enum ToolCategory: String, Codable {
  case artisanSTools = "Artisan's Tools"
  case gamingSets = "Gaming Sets"
  case musicalInstrument = "Musical Instrument"
  case otherTools = "Other Tools"
}

enum VehicleCategory: String, Codable {
  case mountsAndOtherAnimals = "Mounts and Other Animals"
  case tackHarnessAndDrawnVehicles = "Tack, Harness, and Drawn Vehicles"
  case waterborneVehicles = "Waterborne Vehicles"
}

enum WeaponCategory: String, Codable {
  case martial = "Martial"
  case simple = "Simple"
}

enum WeaponRange: String, Codable {
  case melee = "Melee"
  case ranged = "Ranged"
}

// MARK: - FeatureElement
class FeatureElement: Codable {
  let index: String?
  let featureClass: Condition?
  let name: String?
  let level: Int?
  let prerequisites: [FeaturePrerequisite]?
  let desc: [String]?
  let url: String?
  let subclass: Condition?
  let reference: String?
  let featureSpecific: FeatureSpecific?
  let parent: Condition?
  
  enum CodingKeys: String, CodingKey {
    case index
    case featureClass = "class"
    case name, level, prerequisites, desc, url, subclass, reference
    case featureSpecific = "feature_specific"
    case parent
  }
  
  init(index: String?, featureClass: Condition?, name: String?, level: Int?, prerequisites: [FeaturePrerequisite]?, desc: [String]?, url: String?, subclass: Condition?, reference: String?, featureSpecific: FeatureSpecific?, parent: Condition?) {
    self.index = index
    self.featureClass = featureClass
    self.name = name
    self.level = level
    self.prerequisites = prerequisites
    self.desc = desc
    self.url = url
    self.subclass = subclass
    self.reference = reference
    self.featureSpecific = featureSpecific
    self.parent = parent
  }
}

// MARK: - FeatureSpecific
class FeatureSpecific: Codable {
  let expertiseOptions: ExpertiseOptions?
  let subfeatureOptions: LanguageOptionsElement?
  let invocations: [Condition]?
  
  enum CodingKeys: String, CodingKey {
    case expertiseOptions = "expertise_options"
    case subfeatureOptions = "subfeature_options"
    case invocations
  }
  
  init(expertiseOptions: ExpertiseOptions?, subfeatureOptions: LanguageOptionsElement?, invocations: [Condition]?) {
    self.expertiseOptions = expertiseOptions
    self.subfeatureOptions = subfeatureOptions
    self.invocations = invocations
  }
}

// MARK: - ExpertiseOptions
class ExpertiseOptions: Codable {
  let choose: Int?
  let type: String?
  let from: ExpertiseOptionsFrom?
  
  init(choose: Int?, type: String?, from: ExpertiseOptionsFrom?) {
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - ExpertiseOptionsFrom
class ExpertiseOptionsFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [HilariousOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [HilariousOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

// MARK: - HilariousOption
class HilariousOption: Codable {
  let optionType: FluffyOptionType?
  let item: Condition?
  let choice: LanguageOptionsElement?
  let items: [HilariousOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case item, choice, items
  }
  
  init(optionType: FluffyOptionType?, item: Condition?, choice: LanguageOptionsElement?, items: [HilariousOption]?) {
    self.optionType = optionType
    self.item = item
    self.choice = choice
    self.items = items
  }
}

// MARK: - FeaturePrerequisite
class FeaturePrerequisite: Codable {
  let type: ConditionType?
  let spell, feature: String?
  let level: Int?
  
  init(type: ConditionType?, spell: String?, feature: String?, level: Int?) {
    self.type = type
    self.spell = spell
    self.feature = feature
    self.level = level
  }
}

// MARK: - Language
class Language: Codable {
  let index, name: String?
  let type: LanguageType?
  let typicalSpeakers: [String]?
  let script, url, desc: String?
  
  enum CodingKeys: String, CodingKey {
    case index, name, type
    case typicalSpeakers = "typical_speakers"
    case script, url, desc
  }
  
  init(index: String?, name: String?, type: LanguageType?, typicalSpeakers: [String]?, script: String?, url: String?, desc: String?) {
    self.index = index
    self.name = name
    self.type = type
    self.typicalSpeakers = typicalSpeakers
    self.script = script
    self.url = url
    self.desc = desc
  }
}

enum LanguageType: String, Codable {
  case exotic = "Exotic"
  case standard = "Standard"
}

// MARK: - Level
class Level: Codable {
  let level, abilityScoreBonuses, profBonus: Int?
  let features: [Condition]?
  let classSpecific: ClassSpecific?
  let index: String?
  let levelClass: Condition?
  let url: String?
  let spellcasting: [String: Int]?
  let subclass: Condition?
  let subclassSpecific: SubclassSpecific?
  
  enum CodingKeys: String, CodingKey {
    case level
    case abilityScoreBonuses = "ability_score_bonuses"
    case profBonus = "prof_bonus"
    case features
    case classSpecific = "class_specific"
    case index
    case levelClass = "class"
    case url, spellcasting, subclass
    case subclassSpecific = "subclass_specific"
  }
  
  init(level: Int?, abilityScoreBonuses: Int?, profBonus: Int?, features: [Condition]?, classSpecific: ClassSpecific?, index: String?, levelClass: Condition?, url: String?, spellcasting: [String: Int]?, subclass: Condition?, subclassSpecific: SubclassSpecific?) {
    self.level = level
    self.abilityScoreBonuses = abilityScoreBonuses
    self.profBonus = profBonus
    self.features = features
    self.classSpecific = classSpecific
    self.index = index
    self.levelClass = levelClass
    self.url = url
    self.spellcasting = spellcasting
    self.subclass = subclass
    self.subclassSpecific = subclassSpecific
  }
}

// MARK: - ClassSpecific
class ClassSpecific: Codable {
  let rageCount, rageDamageBonus, brutalCriticalDice, bardicInspirationDie: Int?
  let songOfRESTDie, magicalSecretsMax5, magicalSecretsMax7, magicalSecretsMax9: Int?
  let channelDivinityCharges: Int?
  let destroyUndeadCR, wildShapeMaxCR: Double?
  let wildShapeSwim, wildShapeFly: Bool?
  let actionSurges, indomitableUses, extraAttacks: Int?
  let martialArts: MartialArts?
  let kiPoints, unarmoredMovement, auraRange, favoredEnemies: Int?
  let favoredTerrain: Int?
  let sneakAttack: MartialArts?
  let sorceryPoints, metamagicKnown: Int?
  let creatingSpellSlots: [CreatingSpellSlot]?
  let invocationsKnown, mysticArcanumLevel6, mysticArcanumLevel7, mysticArcanumLevel8: Int?
  let mysticArcanumLevel9, arcaneRecoveryLevels: Int?
  
  enum CodingKeys: String, CodingKey {
    case rageCount = "rage_count"
    case rageDamageBonus = "rage_damage_bonus"
    case brutalCriticalDice = "brutal_critical_dice"
    case bardicInspirationDie = "bardic_inspiration_die"
    case songOfRESTDie = "song_of_rest_die"
    case magicalSecretsMax5 = "magical_secrets_max_5"
    case magicalSecretsMax7 = "magical_secrets_max_7"
    case magicalSecretsMax9 = "magical_secrets_max_9"
    case channelDivinityCharges = "channel_divinity_charges"
    case destroyUndeadCR = "destroy_undead_cr"
    case wildShapeMaxCR = "wild_shape_max_cr"
    case wildShapeSwim = "wild_shape_swim"
    case wildShapeFly = "wild_shape_fly"
    case actionSurges = "action_surges"
    case indomitableUses = "indomitable_uses"
    case extraAttacks = "extra_attacks"
    case martialArts = "martial_arts"
    case kiPoints = "ki_points"
    case unarmoredMovement = "unarmored_movement"
    case auraRange = "aura_range"
    case favoredEnemies = "favored_enemies"
    case favoredTerrain = "favored_terrain"
    case sneakAttack = "sneak_attack"
    case sorceryPoints = "sorcery_points"
    case metamagicKnown = "metamagic_known"
    case creatingSpellSlots = "creating_spell_slots"
    case invocationsKnown = "invocations_known"
    case mysticArcanumLevel6 = "mystic_arcanum_level_6"
    case mysticArcanumLevel7 = "mystic_arcanum_level_7"
    case mysticArcanumLevel8 = "mystic_arcanum_level_8"
    case mysticArcanumLevel9 = "mystic_arcanum_level_9"
    case arcaneRecoveryLevels = "arcane_recovery_levels"
  }
  
  init(rageCount: Int?, rageDamageBonus: Int?, brutalCriticalDice: Int?, bardicInspirationDie: Int?, songOfRESTDie: Int?, magicalSecretsMax5: Int?, magicalSecretsMax7: Int?, magicalSecretsMax9: Int?, channelDivinityCharges: Int?, destroyUndeadCR: Double?, wildShapeMaxCR: Double?, wildShapeSwim: Bool?, wildShapeFly: Bool?, actionSurges: Int?, indomitableUses: Int?, extraAttacks: Int?, martialArts: MartialArts?, kiPoints: Int?, unarmoredMovement: Int?, auraRange: Int?, favoredEnemies: Int?, favoredTerrain: Int?, sneakAttack: MartialArts?, sorceryPoints: Int?, metamagicKnown: Int?, creatingSpellSlots: [CreatingSpellSlot]?, invocationsKnown: Int?, mysticArcanumLevel6: Int?, mysticArcanumLevel7: Int?, mysticArcanumLevel8: Int?, mysticArcanumLevel9: Int?, arcaneRecoveryLevels: Int?) {
    self.rageCount = rageCount
    self.rageDamageBonus = rageDamageBonus
    self.brutalCriticalDice = brutalCriticalDice
    self.bardicInspirationDie = bardicInspirationDie
    self.songOfRESTDie = songOfRESTDie
    self.magicalSecretsMax5 = magicalSecretsMax5
    self.magicalSecretsMax7 = magicalSecretsMax7
    self.magicalSecretsMax9 = magicalSecretsMax9
    self.channelDivinityCharges = channelDivinityCharges
    self.destroyUndeadCR = destroyUndeadCR
    self.wildShapeMaxCR = wildShapeMaxCR
    self.wildShapeSwim = wildShapeSwim
    self.wildShapeFly = wildShapeFly
    self.actionSurges = actionSurges
    self.indomitableUses = indomitableUses
    self.extraAttacks = extraAttacks
    self.martialArts = martialArts
    self.kiPoints = kiPoints
    self.unarmoredMovement = unarmoredMovement
    self.auraRange = auraRange
    self.favoredEnemies = favoredEnemies
    self.favoredTerrain = favoredTerrain
    self.sneakAttack = sneakAttack
    self.sorceryPoints = sorceryPoints
    self.metamagicKnown = metamagicKnown
    self.creatingSpellSlots = creatingSpellSlots
    self.invocationsKnown = invocationsKnown
    self.mysticArcanumLevel6 = mysticArcanumLevel6
    self.mysticArcanumLevel7 = mysticArcanumLevel7
    self.mysticArcanumLevel8 = mysticArcanumLevel8
    self.mysticArcanumLevel9 = mysticArcanumLevel9
    self.arcaneRecoveryLevels = arcaneRecoveryLevels
  }
}

// MARK: - CreatingSpellSlot
class CreatingSpellSlot: Codable {
  let spellSlotLevel, sorceryPointCost: Int?
  
  enum CodingKeys: String, CodingKey {
    case spellSlotLevel = "spell_slot_level"
    case sorceryPointCost = "sorcery_point_cost"
  }
  
  init(spellSlotLevel: Int?, sorceryPointCost: Int?) {
    self.spellSlotLevel = spellSlotLevel
    self.sorceryPointCost = sorceryPointCost
  }
}

// MARK: - MartialArts
class MartialArts: Codable {
  let diceCount, diceValue: Int?
  
  enum CodingKeys: String, CodingKey {
    case diceCount = "dice_count"
    case diceValue = "dice_value"
  }
  
  init(diceCount: Int?, diceValue: Int?) {
    self.diceCount = diceCount
    self.diceValue = diceValue
  }
}

// MARK: - SubclassSpecific
class SubclassSpecific: Codable {
  let additionalMagicalSecretsMaxLvl, auraRange: Int?
  
  enum CodingKeys: String, CodingKey {
    case additionalMagicalSecretsMaxLvl = "additional_magical_secrets_max_lvl"
    case auraRange = "aura_range"
  }
  
  init(additionalMagicalSecretsMaxLvl: Int?, auraRange: Int?) {
    self.additionalMagicalSecretsMaxLvl = additionalMagicalSecretsMaxLvl
    self.auraRange = auraRange
  }
}

// MARK: - MagicItem
class MagicItem: Codable {
  let index, name: String?
  let equipmentCategory: Condition?
  let rarity: Rarity?
  let variants: [Condition]?
  let variant: Bool?
  let desc: [String]?
  let image, url: String?
  
  enum CodingKeys: String, CodingKey {
    case index, name
    case equipmentCategory = "equipment_category"
    case rarity, variants, variant, desc, image, url
  }
  
  init(index: String?, name: String?, equipmentCategory: Condition?, rarity: Rarity?, variants: [Condition]?, variant: Bool?, desc: [String]?, image: String?, url: String?) {
    self.index = index
    self.name = name
    self.equipmentCategory = equipmentCategory
    self.rarity = rarity
    self.variants = variants
    self.variant = variant
    self.desc = desc
    self.image = image
    self.url = url
  }
}

// MARK: - Rarity
class Rarity: Codable {
  let name: RarityName?
  
  init(name: RarityName?) {
    self.name = name
  }
}

enum RarityName: String, Codable {
  case artifact = "Artifact"
  case common = "Common"
  case legendary = "Legendary"
  case rare = "Rare"
  case uncommon = "Uncommon"
  case varies = "Varies"
  case veryRare = "Very Rare"
}

// MARK: - Monster
class Monster: Codable {
  let index, name: String?
  let size: Size?
  let type: MonsterType?
  let alignment: AlignmentEnum?
  let armorClass: [ArmorClassElement]?
  let hitPoints: Int?
  let hitDice, hitPointsRoll: String?
  let speed: Speed?
  let strength, dexterity, constitution, intelligence: Int?
  let wisdom, charisma: Int?
  let proficiencies: [Proficiency]?
  let damageVulnerabilities, damageResistances, damageImmunities: [String]?
  let conditionImmunities: [Condition]?
  let senses: Senses?
  let languages: String?
  let challengeRating: Double?
  let proficiencyBonus, xp: Int?
  let specialAbilities: [SpecialAbility]?
  let actions: [MonsterAction]?
  let legendaryActions: [LegendaryAction]?
  let image, url, desc, subtype: String?
  let reactions: [Reaction]?
  let forms: [Condition]?
  
  enum CodingKeys: String, CodingKey {
    case index, name, size, type, alignment
    case armorClass = "armor_class"
    case hitPoints = "hit_points"
    case hitDice = "hit_dice"
    case hitPointsRoll = "hit_points_roll"
    case speed, strength, dexterity, constitution, intelligence, wisdom, charisma, proficiencies
    case damageVulnerabilities = "damage_vulnerabilities"
    case damageResistances = "damage_resistances"
    case damageImmunities = "damage_immunities"
    case conditionImmunities = "condition_immunities"
    case senses, languages
    case challengeRating = "challenge_rating"
    case proficiencyBonus = "proficiency_bonus"
    case xp
    case specialAbilities = "special_abilities"
    case actions
    case legendaryActions = "legendary_actions"
    case image, url, desc, subtype, reactions, forms
  }
  
  init(index: String?, name: String?, size: Size?, type: MonsterType?, alignment: AlignmentEnum?, armorClass: [ArmorClassElement]?, hitPoints: Int?, hitDice: String?, hitPointsRoll: String?, speed: Speed?, strength: Int?, dexterity: Int?, constitution: Int?, intelligence: Int?, wisdom: Int?, charisma: Int?, proficiencies: [Proficiency]?, damageVulnerabilities: [String]?, damageResistances: [String]?, damageImmunities: [String]?, conditionImmunities: [Condition]?, senses: Senses?, languages: String?, challengeRating: Double?, proficiencyBonus: Int?, xp: Int?, specialAbilities: [SpecialAbility]?, actions: [MonsterAction]?, legendaryActions: [LegendaryAction]?, image: String?, url: String?, desc: String?, subtype: String?, reactions: [Reaction]?, forms: [Condition]?) {
    self.index = index
    self.name = name
    self.size = size
    self.type = type
    self.alignment = alignment
    self.armorClass = armorClass
    self.hitPoints = hitPoints
    self.hitDice = hitDice
    self.hitPointsRoll = hitPointsRoll
    self.speed = speed
    self.strength = strength
    self.dexterity = dexterity
    self.constitution = constitution
    self.intelligence = intelligence
    self.wisdom = wisdom
    self.charisma = charisma
    self.proficiencies = proficiencies
    self.damageVulnerabilities = damageVulnerabilities
    self.damageResistances = damageResistances
    self.damageImmunities = damageImmunities
    self.conditionImmunities = conditionImmunities
    self.senses = senses
    self.languages = languages
    self.challengeRating = challengeRating
    self.proficiencyBonus = proficiencyBonus
    self.xp = xp
    self.specialAbilities = specialAbilities
    self.actions = actions
    self.legendaryActions = legendaryActions
    self.image = image
    self.url = url
    self.desc = desc
    self.subtype = subtype
    self.reactions = reactions
    self.forms = forms
  }
}

// MARK: - MonsterAction
class MonsterAction: Codable {
  let name: String?
  let multiattackType: MultiattackType?
  let desc: String?
  let actions: [ActionAction]?
  let attackBonus: Int?
  let dc: AttackDc?
  let damage: [ActionDamage]?
  let usage: ActionUsage?
  let options: Options?
  let attacks: [Attack]?
  let actionOptions: ActionOptions?
  
  enum CodingKeys: String, CodingKey {
    case name
    case multiattackType = "multiattack_type"
    case desc, actions
    case attackBonus = "attack_bonus"
    case dc, damage, usage, options, attacks
    case actionOptions = "action_options"
  }
  
  init(name: String?, multiattackType: MultiattackType?, desc: String?, actions: [ActionAction]?, attackBonus: Int?, dc: AttackDc?, damage: [ActionDamage]?, usage: ActionUsage?, options: Options?, attacks: [Attack]?, actionOptions: ActionOptions?) {
    self.name = name
    self.multiattackType = multiattackType
    self.desc = desc
    self.actions = actions
    self.attackBonus = attackBonus
    self.dc = dc
    self.damage = damage
    self.usage = usage
    self.options = options
    self.attacks = attacks
    self.actionOptions = actionOptions
  }
}

// MARK: - ActionOptions
class ActionOptions: Codable {
  let choose: Int?
  let type: ItemOptionType?
  let from: ActionOptionsFrom?
  
  init(choose: Int?, type: ItemOptionType?, from: ActionOptionsFrom?) {
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - ActionOptionsFrom
class ActionOptionsFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [AmbitiousOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [AmbitiousOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

// MARK: - AmbitiousOption
class AmbitiousOption: Codable {
  let optionType: ItemOptionType?
  let items: [AmbitiousOption]?
  let actionName: String?
  let count: Int?
  let type: AttackTypeEnum?
  let desc: String?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case items
    case actionName = "action_name"
    case count, type, desc
  }
  
  init(optionType: ItemOptionType?, items: [AmbitiousOption]?, actionName: String?, count: Int?, type: AttackTypeEnum?, desc: String?) {
    self.optionType = optionType
    self.items = items
    self.actionName = actionName
    self.count = count
    self.type = type
    self.desc = desc
  }
}

enum ItemOptionType: String, Codable {
  case action = "action"
  case multiple = "multiple"
}

enum AttackTypeEnum: String, Codable {
  case ability = "ability"
  case magic = "magic"
  case melee = "melee"
  case ranged = "ranged"
}

// MARK: - ActionAction
class ActionAction: Codable {
  let actionName: String?
  let count: Count?
  let type: AttackTypeEnum?
  
  enum CodingKeys: String, CodingKey {
    case actionName = "action_name"
    case count, type
  }
  
  init(actionName: String?, count: Count?, type: AttackTypeEnum?) {
    self.actionName = actionName
    self.count = count
    self.type = type
  }
}

enum Count: Codable {
  case integer(Int)
  case string(String)
  
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let x = try? container.decode(Int.self) {
      self = .integer(x)
      return
    }
    if let x = try? container.decode(String.self) {
      self = .string(x)
      return
    }
    throw DecodingError.typeMismatch(Count.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Count"))
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .integer(let x):
      try container.encode(x)
    case .string(let x):
      try container.encode(x)
    }
  }
}

// MARK: - Attack
class Attack: Codable {
  let name: String?
  let dc: AttackDc?
  let damage: [TwoHandedDamageElement]?
  let optionType: AttackOptionType?
  
  enum CodingKeys: String, CodingKey {
    case name, dc, damage
    case optionType = "option_type"
  }
  
  init(name: String?, dc: AttackDc?, damage: [TwoHandedDamageElement]?, optionType: AttackOptionType?) {
    self.name = name
    self.dc = dc
    self.damage = damage
    self.optionType = optionType
  }
}

// MARK: - AttackDc
class AttackDc: Codable {
  let dcType: Condition?
  let dcValue: Int?
  let successType: DcSuccess?
  
  enum CodingKeys: String, CodingKey {
    case dcType = "dc_type"
    case dcValue = "dc_value"
    case successType = "success_type"
  }
  
  init(dcType: Condition?, dcValue: Int?, successType: DcSuccess?) {
    self.dcType = dcType
    self.dcValue = dcValue
    self.successType = successType
  }
}

enum DcSuccess: String, Codable {
  case half = "half"
  case none = "none"
  case other = "other"
}

enum AttackOptionType: String, Codable {
  case breath = "breath"
}

// MARK: - ActionDamage
class ActionDamage: Codable {
  let damageType: Condition?
  let damageDice: String?
  let dc: AttackDc?
  let choose: Int?
  let type: DamageType?
  let from: DamageFrom?
  
  enum CodingKeys: String, CodingKey {
    case damageType = "damage_type"
    case damageDice = "damage_dice"
    case dc, choose, type, from
  }
  
  init(damageType: Condition?, damageDice: String?, dc: AttackDc?, choose: Int?, type: DamageType?, from: DamageFrom?) {
    self.damageType = damageType
    self.damageDice = damageDice
    self.dc = dc
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - DamageFrom
class DamageFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [CunningOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [CunningOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

// MARK: - CunningOption
class CunningOption: Codable {
  let optionType: DamageType?
  let damageType: Condition?
  let damageDice: String?
  let notes: Notes?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case damageType = "damage_type"
    case damageDice = "damage_dice"
    case notes
  }
  
  init(optionType: DamageType?, damageType: Condition?, damageDice: String?, notes: Notes?) {
    self.optionType = optionType
    self.damageType = damageType
    self.damageDice = damageDice
    self.notes = notes
  }
}

enum Notes: String, Codable {
  case oneHanded = "One handed"
  case twoHanded = "Two handed"
  case withShillelagh = "With shillelagh"
}

enum DamageType: String, Codable {
  case damage = "damage"
}

enum MultiattackType: String, Codable {
  case actionOptions = "action_options"
  case actions = "actions"
}

// MARK: - Options
class Options: Codable {
  let choose: Int?
  let type: OptionsType?
  let from: OptionsFrom?
  
  init(choose: Int?, type: OptionsType?, from: OptionsFrom?) {
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - OptionsFrom
class OptionsFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [Attack]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [Attack]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

enum OptionsType: String, Codable {
  case attack = "attack"
}

// MARK: - ActionUsage
class ActionUsage: Codable {
  let type: PurpleType?
  let times: Int?
  let dice: Dice?
  let minValue: Int?
  let restTypes: [RESTType]?
  
  enum CodingKeys: String, CodingKey {
    case type, times, dice
    case minValue = "min_value"
    case restTypes = "rest_types"
  }
  
  init(type: PurpleType?, times: Int?, dice: Dice?, minValue: Int?, restTypes: [RESTType]?) {
    self.type = type
    self.times = times
    self.dice = dice
    self.minValue = minValue
    self.restTypes = restTypes
  }
}

enum Dice: String, Codable {
  case the1D6 = "1d6"
}

enum RESTType: String, Codable {
  case long = "long"
  case short = "short"
}

enum PurpleType: String, Codable {
  case perDay = "per day"
  case rechargeAfterREST = "recharge after rest"
  case rechargeOnRoll = "recharge on roll"
}

enum AlignmentEnum: String, Codable {
  case anyAlignment = "any alignment"
  case anyChaoticAlignment = "any chaotic alignment"
  case anyEvilAlignment = "any evil alignment"
  case anyNonGoodAlignment = "any non-good alignment"
  case anyNonLawfulAlignment = "any non-lawful alignment"
  case chaoticEvil = "chaotic evil"
  case chaoticGood = "chaotic good"
  case chaoticNeutral = "chaotic neutral"
  case lawfulEvil = "lawful evil"
  case lawfulGood = "lawful good"
  case lawfulNeutral = "lawful neutral"
  case neutral = "neutral"
  case neutralEvil = "neutral evil"
  case neutralGood = "neutral good"
  case neutralGood50OrNeutralEvil50 = "neutral good (50%) or neutral evil (50%)"
  case unaligned = "unaligned"
}

// MARK: - ArmorClassElement
class ArmorClassElement: Codable {
  let type: ArmorClassType?
  let value: Int?
  let condition, spell: Condition?
  let armor: [Condition]?
  let desc: String?
  
  init(type: ArmorClassType?, value: Int?, condition: Condition?, spell: Condition?, armor: [Condition]?, desc: String?) {
    self.type = type
    self.value = value
    self.condition = condition
    self.spell = spell
    self.armor = armor
    self.desc = desc
  }
}

enum ArmorClassType: String, Codable {
  case armor = "armor"
  case condition = "condition"
  case dex = "dex"
  case natural = "natural"
  case spell = "spell"
}

// MARK: - LegendaryAction
class LegendaryAction: Codable {
  let name, desc: String?
  let attackBonus: Int?
  let damage: [TwoHandedDamageElement]?
  let dc: AttackDc?
  
  enum CodingKeys: String, CodingKey {
    case name, desc
    case attackBonus = "attack_bonus"
    case damage, dc
  }
  
  init(name: String?, desc: String?, attackBonus: Int?, damage: [TwoHandedDamageElement]?, dc: AttackDc?) {
    self.name = name
    self.desc = desc
    self.attackBonus = attackBonus
    self.damage = damage
    self.dc = dc
  }
}

// MARK: - Proficiency
class Proficiency: Codable {
  let value: Int?
  let proficiency: Condition?
  
  init(value: Int?, proficiency: Condition?) {
    self.value = value
    self.proficiency = proficiency
  }
}

// MARK: - Reaction
class Reaction: Codable {
  let name, desc: String?
  let dc: AttackDc?
  
  init(name: String?, desc: String?, dc: AttackDc?) {
    self.name = name
    self.desc = desc
    self.dc = dc
  }
}

// MARK: - Senses
class Senses: Codable {
  let darkvision: Blindsight?
  let passivePerception: Int?
  let blindsight, truesight, tremorsense: Blindsight?
  
  enum CodingKeys: String, CodingKey {
    case darkvision
    case passivePerception = "passive_perception"
    case blindsight, truesight, tremorsense
  }
  
  init(darkvision: Blindsight?, passivePerception: Int?, blindsight: Blindsight?, truesight: Blindsight?, tremorsense: Blindsight?) {
    self.darkvision = darkvision
    self.passivePerception = passivePerception
    self.blindsight = blindsight
    self.truesight = truesight
    self.tremorsense = tremorsense
  }
}

enum Blindsight: String, Codable {
  case the10Ft = "10 ft."
  case the120Ft = "120 ft."
  case the30Ft = "30 ft."
  case the30FtBlindBeyondThisRadius = "30 ft. (blind beyond this radius)"
  case the30FtOr10FtWhileDeafenedBlindBeyondThisRadius = "30 ft. or 10 ft. while deafened (blind beyond this radius)"
  case the60Ft = "60 ft."
  case the60FtBlindBeyondThisRadius = "60 ft. (blind beyond this radius)"
  case the90Ft = "90 ft."
}

enum Size: String, Codable {
  case gargantuan = "Gargantuan"
  case huge = "Huge"
  case large = "Large"
  case medium = "Medium"
  case small = "Small"
  case tiny = "Tiny"
}

// MARK: - SpecialAbility
class SpecialAbility: Codable {
  let name, desc: String?
  let dc: AttackDc?
  let spellcasting: SpecialAbilitySpellcasting?
  let usage: SpecialAbilityUsage?
  let damage: [TwoHandedDamageElement]?
  let attackBonus: Int?
  
  enum CodingKeys: String, CodingKey {
    case name, desc, dc, spellcasting, usage, damage
    case attackBonus = "attack_bonus"
  }
  
  init(name: String?, desc: String?, dc: AttackDc?, spellcasting: SpecialAbilitySpellcasting?, usage: SpecialAbilityUsage?, damage: [TwoHandedDamageElement]?, attackBonus: Int?) {
    self.name = name
    self.desc = desc
    self.dc = dc
    self.spellcasting = spellcasting
    self.usage = usage
    self.damage = damage
    self.attackBonus = attackBonus
  }
}

// MARK: - SpecialAbilitySpellcasting
class SpecialAbilitySpellcasting: Codable {
  let level: Int?
  let ability: Condition?
  let dc, modifier: Int?
  let componentsRequired: [Component]?
  let school: School?
  let slots: [String: Int]?
  let spells: [SpellcastingSpell]?
  
  enum CodingKeys: String, CodingKey {
    case level, ability, dc, modifier
    case componentsRequired = "components_required"
    case school, slots, spells
  }
  
  init(level: Int?, ability: Condition?, dc: Int?, modifier: Int?, componentsRequired: [Component]?, school: School?, slots: [String: Int]?, spells: [SpellcastingSpell]?) {
    self.level = level
    self.ability = ability
    self.dc = dc
    self.modifier = modifier
    self.componentsRequired = componentsRequired
    self.school = school
    self.slots = slots
    self.spells = spells
  }
}

enum Component: String, Codable {
  case m = "M"
  case s = "S"
  case v = "V"
}

enum School: String, Codable {
  case cleric = "cleric"
  case druid = "druid"
  case wizard = "wizard"
}

// MARK: - SpellcastingSpell
class SpellcastingSpell: Codable {
  let name: String?
  let level: Int?
  let url: String?
  let usage: SpellUsage?
  let notes: String?
  
  init(name: String?, level: Int?, url: String?, usage: SpellUsage?, notes: String?) {
    self.name = name
    self.level = level
    self.url = url
    self.usage = usage
    self.notes = notes
  }
}

// MARK: - SpellUsage
class SpellUsage: Codable {
  let type: FluffyType?
  let times: Int?
  
  init(type: FluffyType?, times: Int?) {
    self.type = type
    self.times = times
  }
}

enum FluffyType: String, Codable {
  case atWill = "at will"
  case perDay = "per day"
  case perREST = "per rest"
}

// MARK: - SpecialAbilityUsage
class SpecialAbilityUsage: Codable {
  let type: PurpleType?
  let times: Int?
  let restTypes: [RESTType]?
  
  enum CodingKeys: String, CodingKey {
    case type, times
    case restTypes = "rest_types"
  }
  
  init(type: PurpleType?, times: Int?, restTypes: [RESTType]?) {
    self.type = type
    self.times = times
    self.restTypes = restTypes
  }
}

// MARK: - Speed
class Speed: Codable {
  let walk: Burrow?
  let swim, fly: Climb?
  let burrow: Burrow?
  let climb: Climb?
  let hover: Bool?
  
  init(walk: Burrow?, swim: Climb?, fly: Climb?, burrow: Burrow?, climb: Climb?, hover: Bool?) {
    self.walk = walk
    self.swim = swim
    self.fly = fly
    self.burrow = burrow
    self.climb = climb
    self.hover = hover
  }
}

enum Burrow: String, Codable {
  case the0Ft = "0 ft."
  case the10Ft = "10 ft."
  case the15Ft = "15 ft."
  case the20Ft = "20 ft."
  case the25Ft = "25 ft."
  case the30Ft = "30 ft."
  case the40Ft = "40 ft."
  case the50Ft = "50 ft."
  case the5Ft = "5 ft."
  case the60Ft = "60 ft."
}

enum Climb: String, Codable {
  case the10Ft = "10 ft."
  case the120Ft = "120 ft."
  case the150Ft = "150 ft."
  case the20Ft = "20 ft."
  case the30Ft = "30 ft."
  case the40Ft = "40 ft."
  case the50Ft = "50 ft."
  case the60Ft = "60 ft."
  case the80Ft = "80 ft."
  case the90Ft = "90 ft."
}

enum MonsterType: String, Codable {
  case aberration = "aberration"
  case beast = "beast"
  case celestial = "celestial"
  case construct = "construct"
  case dragon = "dragon"
  case elemental = "elemental"
  case fey = "fey"
  case fiend = "fiend"
  case giant = "giant"
  case humanoid = "humanoid"
  case monstrosity = "monstrosity"
  case ooze = "ooze"
  case plant = "plant"
  case swarmOfTinyBeasts = "swarm of Tiny beasts"
  case undead = "undead"
}

// MARK: - ProficiencyElement
class ProficiencyElement: Codable {
  let index: String?
  let type: ProficiencyType?
  let name: String?
  let classes, races: [Condition]?
  let url: String?
  let reference: Condition?
  
  init(index: String?, type: ProficiencyType?, name: String?, classes: [Condition]?, races: [Condition]?, url: String?, reference: Condition?) {
    self.index = index
    self.type = type
    self.name = name
    self.classes = classes
    self.races = races
    self.url = url
    self.reference = reference
  }
}

enum ProficiencyType: String, Codable {
  case armor = "Armor"
  case artisanSTools = "Artisan's Tools"
  case gamingSets = "Gaming Sets"
  case musicalInstruments = "Musical Instruments"
  case other = "Other"
  case savingThrows = "Saving Throws"
  case skills = "Skills"
  case vehicles = "Vehicles"
  case weapons = "Weapons"
}

// MARK: - Race
class Race: Codable {
  let index, name: String?
  let speed: Int?
  let abilityBonuses: [AbilityBonus]?
  let alignment, age: String?
  let size: Size?
  let sizeDescription: String?
  let startingProficiencies: [Condition]?
  let startingProficiencyOptions: LanguageOptionsElement?
  let languages: [Condition]?
  let languageDesc: String?
  let traits, subraces: [Condition]?
  let url: String?
  let languageOptions: LanguageOptionsElement?
  let abilityBonusOptions: AbilityBonusOptions?
  
  enum CodingKeys: String, CodingKey {
    case index, name, speed
    case abilityBonuses = "ability_bonuses"
    case alignment, age, size
    case sizeDescription = "size_description"
    case startingProficiencies = "starting_proficiencies"
    case startingProficiencyOptions = "starting_proficiency_options"
    case languages
    case languageDesc = "language_desc"
    case traits, subraces, url
    case languageOptions = "language_options"
    case abilityBonusOptions = "ability_bonus_options"
  }
  
  init(index: String?, name: String?, speed: Int?, abilityBonuses: [AbilityBonus]?, alignment: String?, age: String?, size: Size?, sizeDescription: String?, startingProficiencies: [Condition]?, startingProficiencyOptions: LanguageOptionsElement?, languages: [Condition]?, languageDesc: String?, traits: [Condition]?, subraces: [Condition]?, url: String?, languageOptions: LanguageOptionsElement?, abilityBonusOptions: AbilityBonusOptions?) {
    self.index = index
    self.name = name
    self.speed = speed
    self.abilityBonuses = abilityBonuses
    self.alignment = alignment
    self.age = age
    self.size = size
    self.sizeDescription = sizeDescription
    self.startingProficiencies = startingProficiencies
    self.startingProficiencyOptions = startingProficiencyOptions
    self.languages = languages
    self.languageDesc = languageDesc
    self.traits = traits
    self.subraces = subraces
    self.url = url
    self.languageOptions = languageOptions
    self.abilityBonusOptions = abilityBonusOptions
  }
}

// MARK: - AbilityBonusOptions
class AbilityBonusOptions: Codable {
  let choose: Int?
  let type: String?
  let from: AbilityBonusOptionsFrom?
  
  init(choose: Int?, type: String?, from: AbilityBonusOptionsFrom?) {
    self.choose = choose
    self.type = type
    self.from = from
  }
}

// MARK: - AbilityBonusOptionsFrom
class AbilityBonusOptionsFrom: Codable {
  let optionSetType: OptionSetType?
  let options: [MagentaOption]?
  
  enum CodingKeys: String, CodingKey {
    case optionSetType = "option_set_type"
    case options
  }
  
  init(optionSetType: OptionSetType?, options: [MagentaOption]?) {
    self.optionSetType = optionSetType
    self.options = options
  }
}

// MARK: - MagentaOption
class MagentaOption: Codable {
  let optionType: String?
  let abilityScore: Condition?
  let bonus: Int?
  
  enum CodingKeys: String, CodingKey {
    case optionType = "option_type"
    case abilityScore = "ability_score"
    case bonus
  }
  
  init(optionType: String?, abilityScore: Condition?, bonus: Int?) {
    self.optionType = optionType
    self.abilityScore = abilityScore
    self.bonus = bonus
  }
}

// MARK: - AbilityBonus
class AbilityBonus: Codable {
  let abilityScore: Condition?
  let bonus: Int?
  
  enum CodingKeys: String, CodingKey {
    case abilityScore = "ability_score"
    case bonus
  }
  
  init(abilityScore: Condition?, bonus: Int?) {
    self.abilityScore = abilityScore
    self.bonus = bonus
  }
}

// MARK: - Spell
class Spell: Codable {
  let index, name: String?
  let desc, higherLevel: [String]?
  let range: RangeEnum?
  let components: [Component]?
  let material: String?
  let ritual: Bool?
  let duration: String?
  let concentration: Bool?
  let castingTime: CastingTime?
  let level: Int?
  let attackType: AttackTypeEnum?
  let damage: SpellDamage?
  let school: Condition?
  let classes, subclasses: [Condition]?
  let url: String?
  let dc: SpellDc?
  let healAtSlotLevel: [String: String]?
  let areaOfEffect: AreaOfEffect?
  
  enum CodingKeys: String, CodingKey {
    case index, name, desc
    case higherLevel = "higher_level"
    case range, components, material, ritual, duration, concentration
    case castingTime = "casting_time"
    case level
    case attackType = "attack_type"
    case damage, school, classes, subclasses, url, dc
    case healAtSlotLevel = "heal_at_slot_level"
    case areaOfEffect = "area_of_effect"
  }
  
  init(index: String?, name: String?, desc: [String]?, higherLevel: [String]?, range: RangeEnum?, components: [Component]?, material: String?, ritual: Bool?, duration: String?, concentration: Bool?, castingTime: CastingTime?, level: Int?, attackType: AttackTypeEnum?, damage: SpellDamage?, school: Condition?, classes: [Condition]?, subclasses: [Condition]?, url: String?, dc: SpellDc?, healAtSlotLevel: [String: String]?, areaOfEffect: AreaOfEffect?) {
    self.index = index
    self.name = name
    self.desc = desc
    self.higherLevel = higherLevel
    self.range = range
    self.components = components
    self.material = material
    self.ritual = ritual
    self.duration = duration
    self.concentration = concentration
    self.castingTime = castingTime
    self.level = level
    self.attackType = attackType
    self.damage = damage
    self.school = school
    self.classes = classes
    self.subclasses = subclasses
    self.url = url
    self.dc = dc
    self.healAtSlotLevel = healAtSlotLevel
    self.areaOfEffect = areaOfEffect
  }
}

// MARK: - AreaOfEffect
class AreaOfEffect: Codable {
  let type: AreaOfEffectType?
  let size: Int?
  
  init(type: AreaOfEffectType?, size: Int?) {
    self.type = type
    self.size = size
  }
}

enum AreaOfEffectType: String, Codable {
  case cone = "cone"
  case cube = "cube"
  case cylinder = "cylinder"
  case line = "line"
  case sphere = "sphere"
}

enum CastingTime: String, Codable {
  case the10Minutes = "10 minutes"
  case the12Hours = "12 hours"
  case the1Action = "1 action"
  case the1BonusAction = "1 bonus action"
  case the1Hour = "1 hour"
  case the1Minute = "1 minute"
  case the1Reaction = "1 reaction"
  case the24Hours = "24 hours"
  case the8Hours = "8 hours"
}

// MARK: - SpellDamage
class SpellDamage: Codable {
  let damageType: Condition?
  let damageAtSlotLevel, damageAtCharacterLevel: [String: String]?
  
  enum CodingKeys: String, CodingKey {
    case damageType = "damage_type"
    case damageAtSlotLevel = "damage_at_slot_level"
    case damageAtCharacterLevel = "damage_at_character_level"
  }
  
  init(damageType: Condition?, damageAtSlotLevel: [String: String]?, damageAtCharacterLevel: [String: String]?) {
    self.damageType = damageType
    self.damageAtSlotLevel = damageAtSlotLevel
    self.damageAtCharacterLevel = damageAtCharacterLevel
  }
}

// MARK: - SpellDc
class SpellDc: Codable {
  let dcType: Condition?
  let dcSuccess: DcSuccess?
  let desc: String?
  
  enum CodingKeys: String, CodingKey {
    case dcType = "dc_type"
    case dcSuccess = "dc_success"
    case desc
  }
  
  init(dcType: Condition?, dcSuccess: DcSuccess?, desc: String?) {
    self.dcType = dcType
    self.dcSuccess = dcSuccess
    self.desc = desc
  }
}

enum RangeEnum: String, Codable {
  case rangeSelf = "Self"
  case sight = "Sight"
  case special = "Special"
  case the100Feet = "100 feet"
  case the10Feet = "10 feet"
  case the120Feet = "120 feet"
  case the150Feet = "150 feet"
  case the1Mile = "1 mile"
  case the300Feet = "300 feet"
  case the30Feet = "30 feet"
  case the500Feet = "500 feet"
  case the500Miles = "500 miles"
  case the5Feet = "5 feet"
  case the60Feet = "60 feet"
  case the90Feet = "90 feet"
  case touch = "Touch"
  case unlimited = "Unlimited"
}

// MARK: - Subclass
class Subclass: Codable {
  let index: String?
  let subclassClass: Condition?
  let name, subclassFlavor: String?
  let desc: [String]?
  let subclassLevels, url: String?
  let spells: [SubclassSpell]?
  
  enum CodingKeys: String, CodingKey {
    case index
    case subclassClass = "class"
    case name
    case subclassFlavor = "subclass_flavor"
    case desc
    case subclassLevels = "subclass_levels"
    case url, spells
  }
  
  init(index: String?, subclassClass: Condition?, name: String?, subclassFlavor: String?, desc: [String]?, subclassLevels: String?, url: String?, spells: [SubclassSpell]?) {
    self.index = index
    self.subclassClass = subclassClass
    self.name = name
    self.subclassFlavor = subclassFlavor
    self.desc = desc
    self.subclassLevels = subclassLevels
    self.url = url
    self.spells = spells
  }
}

// MARK: - SubclassSpell
class SubclassSpell: Codable {
  let prerequisites: [Condition]?
  let spell: Condition?
  
  init(prerequisites: [Condition]?, spell: Condition?) {
    self.prerequisites = prerequisites
    self.spell = spell
  }
}

// MARK: - Subrace
class Subrace: Codable {
  let index, name: String?
  let race: Condition?
  let desc: String?
  let abilityBonuses: [AbilityBonus]?
  let startingProficiencies: [Condition]?
  let languages: [Language]?
  let racialTraits: [Condition]?
  let url: String?
  let languageOptions: LanguageOptionsElement?
  
  enum CodingKeys: String, CodingKey {
    case index, name, race, desc
    case abilityBonuses = "ability_bonuses"
    case startingProficiencies = "starting_proficiencies"
    case languages
    case racialTraits = "racial_traits"
    case url
    case languageOptions = "language_options"
  }
  
  init(index: String?, name: String?, race: Condition?, desc: String?, abilityBonuses: [AbilityBonus]?, startingProficiencies: [Condition]?, languages: [Language]?, racialTraits: [Condition]?, url: String?, languageOptions: LanguageOptionsElement?) {
    self.index = index
    self.name = name
    self.race = race
    self.desc = desc
    self.abilityBonuses = abilityBonuses
    self.startingProficiencies = startingProficiencies
    self.languages = languages
    self.racialTraits = racialTraits
    self.url = url
    self.languageOptions = languageOptions
  }
}

// MARK: - Trait
class Trait: Codable {
  let index: String?
  let races, subraces: [Condition]?
  let name: String?
  let desc: [String]?
  let proficiencies: [Condition]?
  let url: String?
  let proficiencyChoices: LanguageOptionsElement?
  let traitSpecific: TraitSpecific?
  let languageOptions: LanguageOptionsElement?
  let parent: Condition?
  
  enum CodingKeys: String, CodingKey {
    case index, races, subraces, name, desc, proficiencies, url
    case proficiencyChoices = "proficiency_choices"
    case traitSpecific = "trait_specific"
    case languageOptions = "language_options"
    case parent
  }
  
  init(index: String?, races: [Condition]?, subraces: [Condition]?, name: String?, desc: [String]?, proficiencies: [Condition]?, url: String?, proficiencyChoices: LanguageOptionsElement?, traitSpecific: TraitSpecific?, languageOptions: LanguageOptionsElement?, parent: Condition?) {
    self.index = index
    self.races = races
    self.subraces = subraces
    self.name = name
    self.desc = desc
    self.proficiencies = proficiencies
    self.url = url
    self.proficiencyChoices = proficiencyChoices
    self.traitSpecific = traitSpecific
    self.languageOptions = languageOptions
    self.parent = parent
  }
}

// MARK: - TraitSpecific
class TraitSpecific: Codable {
  let spellOptions, subtraitOptions: LanguageOptionsElement?
  let damageType: Condition?
  let breathWeapon: BreathWeapon?
  
  enum CodingKeys: String, CodingKey {
    case spellOptions = "spell_options"
    case subtraitOptions = "subtrait_options"
    case damageType = "damage_type"
    case breathWeapon = "breath_weapon"
  }
  
  init(spellOptions: LanguageOptionsElement?, subtraitOptions: LanguageOptionsElement?, damageType: Condition?, breathWeapon: BreathWeapon?) {
    self.spellOptions = spellOptions
    self.subtraitOptions = subtraitOptions
    self.damageType = damageType
    self.breathWeapon = breathWeapon
  }
}

// MARK: - BreathWeapon
class BreathWeapon: Codable {
  let name: BreathWeaponName?
  let desc: String?
  let areaOfEffect: AreaOfEffect?
  let usage: SpellUsage?
  let dc: BreathWeaponDc?
  let damage: [BreathWeaponDamage]?
  
  enum CodingKeys: String, CodingKey {
    case name, desc
    case areaOfEffect = "area_of_effect"
    case usage, dc, damage
  }
  
  init(name: BreathWeaponName?, desc: String?, areaOfEffect: AreaOfEffect?, usage: SpellUsage?, dc: BreathWeaponDc?, damage: [BreathWeaponDamage]?) {
    self.name = name
    self.desc = desc
    self.areaOfEffect = areaOfEffect
    self.usage = usage
    self.dc = dc
    self.damage = damage
  }
}

// MARK: - BreathWeaponDamage
class BreathWeaponDamage: Codable {
  let damageType: Condition?
  let damageAtCharacterLevel: [String: DamageAtCharacterLevel]?
  
  enum CodingKeys: String, CodingKey {
    case damageType = "damage_type"
    case damageAtCharacterLevel = "damage_at_character_level"
  }
  
  init(damageType: Condition?, damageAtCharacterLevel: [String: DamageAtCharacterLevel]?) {
    self.damageType = damageType
    self.damageAtCharacterLevel = damageAtCharacterLevel
  }
}

enum DamageAtCharacterLevel: String, Codable {
  case the2D6 = "2d6"
  case the3D6 = "3d6"
  case the4D6 = "4d6"
  case the5D6 = "5d6"
}

// MARK: - BreathWeaponDc
class BreathWeaponDc: Codable {
  let dcType: Condition?
  let successType: DcSuccess?
  
  enum CodingKeys: String, CodingKey {
    case dcType = "dc_type"
    case successType = "success_type"
  }
  
  init(dcType: Condition?, successType: DcSuccess?) {
    self.dcType = dcType
    self.successType = successType
  }
}

enum BreathWeaponName: String, Codable {
  case breathWeapon = "Breath Weapon"
}

typealias AbilityScores = [AbilityScore]
typealias Alignments = [Alignment]
typealias Backgrounds = [Background]
typealias Classes = [Class]
typealias Conditions = [Condition]
typealias DamageTypes = [Condition]
typealias EquipmentCategories = [Condition]
typealias Equipment = [EquipmentElement]
typealias Feats = [Condition]
typealias Features = [FeatureElement]
typealias Languages = [Language]
typealias Levels = [Level]
typealias MagicItems = [MagicItem]
typealias MagicSchools = [Condition]
typealias Monsters = [Monster]
typealias Proficiencies = [ProficiencyElement]
typealias Races = [Race]
typealias RuleSections = [Condition]
typealias Rules = [Condition]
typealias Skills = [Condition]
typealias Spells = [Spell]
typealias Subclasses = [Subclass]
typealias Subraces = [Subrace]
typealias Traits = [Trait]
typealias WeaponProperties = [Condition]

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//            return true
//    }
//
//    public var hashValue: Int {
//            return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if !container.decodeNil() {
//                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//            return nil
//    }
//
//    required init?(stringValue: String) {
//            key = stringValue
//    }
//
//    var intValue: Int? {
//            return nil
//    }
//
//    var stringValue: String {
//            return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//            return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//            return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//            if let value = try? container.decode(Bool.self) {
//                    return value
//            }
//            if let value = try? container.decode(Int64.self) {
//                    return value
//            }
//            if let value = try? container.decode(Double.self) {
//                    return value
//            }
//            if let value = try? container.decode(String.self) {
//                    return value
//            }
//            if container.decodeNil() {
//                    return JSONNull()
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//            if let value = try? container.decode(Bool.self) {
//                    return value
//            }
//            if let value = try? container.decode(Int64.self) {
//                    return value
//            }
//            if let value = try? container.decode(Double.self) {
//                    return value
//            }
//            if let value = try? container.decode(String.self) {
//                    return value
//            }
//            if let value = try? container.decodeNil() {
//                    if value {
//                            return JSONNull()
//                    }
//            }
//            if var container = try? container.nestedUnkeyedContainer() {
//                    return try decodeArray(from: &container)
//            }
//            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//                    return try decodeDictionary(from: &container)
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//            if let value = try? container.decode(Bool.self, forKey: key) {
//                    return value
//            }
//            if let value = try? container.decode(Int64.self, forKey: key) {
//                    return value
//            }
//            if let value = try? container.decode(Double.self, forKey: key) {
//                    return value
//            }
//            if let value = try? container.decode(String.self, forKey: key) {
//                    return value
//            }
//            if let value = try? container.decodeNil(forKey: key) {
//                    if value {
//                            return JSONNull()
//                    }
//            }
//            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//                    return try decodeArray(from: &container)
//            }
//            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//                    return try decodeDictionary(from: &container)
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//            var arr: [Any] = []
//            while !container.isAtEnd {
//                    let value = try decode(from: &container)
//                    arr.append(value)
//            }
//            return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//            var dict = [String: Any]()
//            for key in container.allKeys {
//                    let value = try decode(from: &container, forKey: key)
//                    dict[key.stringValue] = value
//            }
//            return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//            for value in array {
//                    if let value = value as? Bool {
//                            try container.encode(value)
//                    } else if let value = value as? Int64 {
//                            try container.encode(value)
//                    } else if let value = value as? Double {
//                            try container.encode(value)
//                    } else if let value = value as? String {
//                            try container.encode(value)
//                    } else if value is JSONNull {
//                            try container.encodeNil()
//                    } else if let value = value as? [Any] {
//                            var container = container.nestedUnkeyedContainer()
//                            try encode(to: &container, array: value)
//                    } else if let value = value as? [String: Any] {
//                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                            try encode(to: &container, dictionary: value)
//                    } else {
//                            throw encodingError(forValue: value, codingPath: container.codingPath)
//                    }
//            }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//            for (key, value) in dictionary {
//                    let key = JSONCodingKey(stringValue: key)!
//                    if let value = value as? Bool {
//                            try container.encode(value, forKey: key)
//                    } else if let value = value as? Int64 {
//                            try container.encode(value, forKey: key)
//                    } else if let value = value as? Double {
//                            try container.encode(value, forKey: key)
//                    } else if let value = value as? String {
//                            try container.encode(value, forKey: key)
//                    } else if value is JSONNull {
//                            try container.encodeNil(forKey: key)
//                    } else if let value = value as? [Any] {
//                            var container = container.nestedUnkeyedContainer(forKey: key)
//                            try encode(to: &container, array: value)
//                    } else if let value = value as? [String: Any] {
//                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                            try encode(to: &container, dictionary: value)
//                    } else {
//                            throw encodingError(forValue: value, codingPath: container.codingPath)
//                    }
//            }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//            if let value = value as? Bool {
//                    try container.encode(value)
//            } else if let value = value as? Int64 {
//                    try container.encode(value)
//            } else if let value = value as? Double {
//                    try container.encode(value)
//            } else if let value = value as? String {
//                    try container.encode(value)
//            } else if value is JSONNull {
//                    try container.encodeNil()
//            } else {
//                    throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//    }
//
//    public required init(from decoder: Decoder) throws {
//            if var arrayContainer = try? decoder.unkeyedContainer() {
//                    self.value = try JSONAny.decodeArray(from: &arrayContainer)
//            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//                    self.value = try JSONAny.decodeDictionary(from: &container)
//            } else {
//                    let container = try decoder.singleValueContainer()
//                    self.value = try JSONAny.decode(from: container)
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            if let arr = self.value as? [Any] {
//                    var container = encoder.unkeyedContainer()
//                    try JSONAny.encode(to: &container, array: arr)
//            } else if let dict = self.value as? [String: Any] {
//                    var container = encoder.container(keyedBy: JSONCodingKey.self)
//                    try JSONAny.encode(to: &container, dictionary: dict)
//            } else {
//                    var container = encoder.singleValueContainer()
//                    try JSONAny.encode(to: &container, value: self.value)
//            }
//    }
//}
