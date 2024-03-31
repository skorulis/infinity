//  Created by Alexander Skorulis on 31/3/2024.


import Foundation

extension SkillValues {
    
    var strengthDamageBonus: Int {
        level(skill: .strength) / 5
    }
    
    var toHitBonus: Int {
        level(skill: .dexterity)
    }
    
    var healthBonus: Int {
        level(skill: .toughness)
    }
    
    var derivedAttributes: DerivedAttributeValues {
        return .init(values: [
            .maxHealth: healthBonus
        ])
    }
}