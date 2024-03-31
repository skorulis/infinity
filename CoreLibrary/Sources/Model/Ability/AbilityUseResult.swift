//Created by Alexander Skorulis on 27/3/2024.

import Foundation

struct AbilityUseResult {
    
    let entities: [UUID: Entity]
    let effects: [Effect]
    
    func entity(id: UUID) -> Entity {
        return entities[id]!
    }
}
