//Created by Alexander Skorulis on 27/3/2024.

import Foundation

final class AbilityService {
    
    func use(ability: Ability, source: Entity, target: Entity) -> AbilityUseResult {
        let effects = self.effects(ability: ability, source: source, target: target)
        
        var entities = [
            source.id: source,
            target.id: target
        ]
        
        for effect in effects {
            switch effect {
            case let .immediate(uuid, immediateEffect):
                entities[uuid]?.apply(effect: immediateEffect)
            }
        }
        
        return .init(
            entities: entities,
            effects: effects
        )
    }
    
    private func effects(ability: Ability, source: Entity, target: Entity) -> [Effect] {
        switch ability {
        case .mainHandAttack:
            return mainHandAttack(source: source, target: target)
        case .secondHandAttack:
            fatalError("TODO")
        }
    }
    
    private func mainHandAttack(source: Entity, target: Entity) -> [Effect] {
        let damage = ImmediateEffect.damage(10)
        return [.immediate(target.id, damage)]
    }
    
}
