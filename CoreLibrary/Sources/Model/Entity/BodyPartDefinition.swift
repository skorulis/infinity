//  Created by Alexander Skorulis on 7/4/2024.

import Foundation

public struct BodyPartDefinition {
    
    let weapon: WeaponInfo?
    
    init(weapon: WeaponInfo? = nil) {
        self.weapon = weapon
    }
}
