//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public struct AbilityUseResult {
    
    public let ability: Ability
    public let entities: [UUID: Entity]
    public let result: AbilityResult
    
    public func entity(id: UUID) -> Entity {
        return entities[id]!
    }
    
    var events: [Event] { result.events }
    var skillUse: SkillUse { result.skillUse }
}

public struct AbilityResult {
    let effects: [Effect]
    let events: [Event]
    let skillUse: SkillUse
    
    init(effects: [Effect], events: [Event], skillUse: SkillUse) {
        self.effects = effects
        self.events = events
        self.skillUse = skillUse
    }
}
