//  Created by Alexander Skorulis on 31/3/2024.


import Foundation

extension Entity {
    
    var strengthDamageBonus: Int {
        skills.level(skill: .strength) / 5
    }
    
    var toHitBonus: Int {
        skills.level(skill: .dexterity)
    }
    
    var healthCalculation: Int {
        return 20 + skills.level(skill: .toughness)
    }
}
