//  Created by Alexander Skorulis on 13/4/2024.

import Foundation

struct WeaponInfo {
    
    let damage: ClosedRange<Int>
    let hitBonuses: [Skill: Float]
    let damageBonus: [Skill: Float]
}
