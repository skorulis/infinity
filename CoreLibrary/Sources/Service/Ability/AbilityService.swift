//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public final class AbilityService {
    
    let random: RandomService
    
    public init(random: RandomService) {
        self.random = random
    }
    
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
        let hitChance = random.int(from: 0, to: 100) + source.toHitBonus
        let defence = 50
        if hitChance < defence {
            return []
        }
        let damageRange = (2...10).move(distance: source.strengthDamageBonus)
        let damage = random.int(range: damageRange)
        let damageEffect = ImmediateEffect.damage(damage)
        return [.immediate(target.id, damageEffect)]
    }
    
}
