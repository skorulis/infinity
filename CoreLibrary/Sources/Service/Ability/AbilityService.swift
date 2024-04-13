//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public final class AbilityService {
    
    let random: RandomService
    
    public init(random: RandomService) {
        self.random = random
    }
    
    func use(ability: Ability, source: Entity, target: Entity) -> AbilityUseResult {
        let (effects, events) = self.outcome(ability: ability, source: source, target: target)
        
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
            ability: ability,
            entities: entities,
            effects: effects,
            events: events
        )
    }
    
    private func outcome(ability: Ability, source: Entity, target: Entity) -> ([Effect], [Event]) {
        switch ability {
        case .mainHandAttack:
            fatalError("TODO")
        case .secondHandAttack:
            fatalError("TODO")
        case let .unarmed(bodyPart):
            return unarmedAttack(source: source, target: target, bodyPart: bodyPart)
        }
    }
    
    private func unarmedAttack(
        source: Entity,
        target: Entity,
        bodyPart: BodyPart
    ) -> ([Effect], [Event]) {
        let def = source.biology[bodyPart]!
        let weapon = def.weapon!
        let hitBonus = self.hitBonus(source: source, weapon: weapon)
        let hitChance = random.int(from: 0, to: 100) + hitBonus
        let defence = 50
        if hitChance < defence {
            return ([], [.miss])
        }
        let damage = random.int(range: weapon.damage) + damageBonus(source: source, weapon: weapon)
        let damageEffect = ImmediateEffect.damage(damage)
        return ([.immediate(target.id, damageEffect)], [.hit(damage)])
    }
    
    func hitBonus(source: Entity, weapon: WeaponInfo) -> Int {
        return weapon.hitBonuses.reduce(0) { partialResult, vk in
            return partialResult + Int(Float(source.skills[vk.key]) * vk.value)
        }
    }
    
    func damageBonus(source: Entity, weapon: WeaponInfo) -> Int {
        return weapon.damageBonus.reduce(0) { partialResult, vk in
            return partialResult + Int(Float(source.skills[vk.key]) * vk.value)
        }
    }
    
}
