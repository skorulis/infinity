//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public typealias EntityID = UUID

public struct Entity {
    
    public let id: EntityID = .init()
    private var properName: String?
    
    public let race: Race
    public var skills: SkillValues
    public private(set) var derived: DerivedAttributeValues = .init(values: [:])
    
    public var health: Int = 0
    
    public init(race: Race, skills: SkillValues = .init()) {
        self.race = race
        self.skills = skills
        
        self.reset()
    }
    
    mutating func apply(effect: ImmediateEffect) {
        switch effect {
        case let .damage(amount):
            take(damage: amount)
        default:
            break // Do nothing by default    
        }
    }
    
    public mutating func reset() {
        calulateDerivedValues()
        health = derived.value(.maxHealth)
    }
    
    mutating func take(damage: Int) {
        precondition(damage >= 0)
        self.health = max(health - damage, 0)
    }
    
    mutating func calulateDerivedValues() {
        self.derived = skills.derivedAttributes + race.derivedAttributes
    }
    
    var level: Int {
        return skills.maxLevel
    }

}
