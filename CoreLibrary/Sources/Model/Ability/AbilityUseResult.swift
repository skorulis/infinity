//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public struct AbilityUseResult {
    
    public let ability: Ability
    public let entities: [UUID: Entity]
    public let effects: [Effect]
    public let events: [Event]
    
    public func entity(id: UUID) -> Entity {
        return entities[id]!
    }
}
