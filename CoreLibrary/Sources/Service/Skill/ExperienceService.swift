//  Created by Alexander Skorulis on 13/4/2024.

import Foundation

public final class ExperienceService {
    
    public init() {}
    
    public func experience(for entity: Entity) -> Float {
        return Float(entity.level) * entity.attributes[.xpMultiplier].floatValue
    }
    
    public func experience(for entity: Entity, from: Entity) -> Float {
        let healthLost = 1 - (Float(from.health) / Float(from.maxHealth))
        let pctGain = healthLost * healthLost
        return experience(for: from) * pctGain
    }
}
