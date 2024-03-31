//Created by Alexander Skorulis on 27/3/2024.

import Foundation

typealias EntityID = UUID

public struct Entity {
    
    let id: EntityID = .init()
    
    var skills: SkillValues = .init()
    var health: Health = .init(current: 50, max: 50)
    
    mutating func apply(effect: ImmediateEffect) {
        switch effect {
        case let .damage(amount):
            health.take(amount: amount)
        default:
            break // Do nothing by default    
        }
    }
    
    mutating func updateCalculations() {
        health.maxValue = healthCalculation
    }

}
