//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public typealias EntityID = UUID

public struct Entity {
    
    public let id: EntityID = .init()
    
    public var skills: SkillValues
    public var health: Health
    
    public init(
        skills: SkillValues = .init(),
        health: Health = .init(current: 50, max: 50)
    ) {
        self.skills = skills
        self.health = health
        
        self.reset()
    }
    
    mutating func apply(effect: ImmediateEffect) {
        switch effect {
        case let .damage(amount):
            health.take(amount: amount)
        default:
            break // Do nothing by default    
        }
    }
    
    public mutating func reset() {
        updateCalculations()
        health.reset()
    }
    
    mutating func updateCalculations() {
        health.maxValue = healthCalculation
    }

}
