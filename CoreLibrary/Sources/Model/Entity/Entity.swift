//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public typealias EntityID = UUID

public struct Entity {
    
    public let id: EntityID = .init()
    private var properName: String?
    
    public let race: Race
    public let raceModifiers: [RaceModifier]
    public var skills: SkillValues {
        didSet {
            self.calulateDerivedValues()
        }
    }
    public var abilities: [Ability]
    public var biology: [BodyPart: BodyPartDefinition]
    public private(set) var derived: DerivedAttributeValues = .init(values: [:])
    
    public var health: Int = 0
    public var gatheredSpeed: Int = 0
    public var maxHealth: Int { derived[.maxHealth] }
    
    public init(
        race: Race,
        raceModifiers: [RaceModifier] = [],
        skills: SkillValues = .init(),
        biology: [BodyPart: BodyPartDefinition],
        abilities: [Ability]
    ) {
        self.race = race
        self.raceModifiers = raceModifiers
        self.skills = skills
        self.biology = biology
        self.abilities = abilities
        
        self.reset()
    }
    
    mutating func apply(effect: ImmediateEffect) {
        switch effect {
        case let .damage(amount):
            take(damage: amount)
        case let .useSpeed(amount):
            gatheredSpeed = max(0, gatheredSpeed - amount)
        case .miss, .hit:
            break // Do nothing
        }
    }
    
    public mutating func reset() {
        calulateDerivedValues()
        health = maxHealth
    }
    
    mutating func take(damage: Int) {
        precondition(damage >= 0)
        self.health = max(health - damage, 0)
    }
    
    mutating func calulateDerivedValues() {
        self.derived = AttributeFormulas.derivedAttributes(
            attributes: attributes,
            skills: skills
        )
    }
    
    public var level: Int {
        return skills.maxLevel
    }
    
    public var name: String {
        return properName ?? "Lvl \(level) \(race.rawValue)"
    }
    
    public var attributes: AttributeValues {
        var combinedAtts = race.attributes + .default
        for raceModifier in raceModifiers {
            combinedAtts = combinedAtts + raceModifier.attributes
        }
        return combinedAtts
    }

}
