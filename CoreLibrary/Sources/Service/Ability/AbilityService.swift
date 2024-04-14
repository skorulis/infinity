//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public final class AbilityService {
    
    let random: RandomService
    
    public init(random: RandomService) {
        self.random = random
    }
    
    func use(ability: Ability, source: Entity, target: Entity) -> AbilityUseResult {
        let result = self.outcome(ability: ability, source: source, target: target)
        
        var entities = [
            source.id: source,
            target.id: target
        ]
        
        for effect in result.effects {
            switch effect {
            case let .immediate(uuid, immediateEffect):
                entities[uuid]?.apply(effect: immediateEffect)
            }
        }
        
        return .init(
            ability: ability,
            entities: entities,
            result: result
        )
    }
    
    private func outcome(ability: Ability, source: Entity, target: Entity) -> AbilityResult {
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
    ) -> AbilityResult {
        var skillUse = SkillUse()
        let def = source.biology[bodyPart]!
        let weapon = def.weapon!
        let hitBonus = self.hitBonus(source: source, weapon: weapon)
        let hitChance = random.int(from: 0, to: 100) + hitBonus.value
        skillUse += hitBonus.usedSkills
        let defence = 50
        if hitChance < defence {
            return .init(effects: [], events: [.miss], skillUse: skillUse)
        }
        let damageBonus = damageBonus(source: source, weapon: weapon)
        skillUse += damageBonus.usedSkills
        let damage = random.int(range: weapon.damage) + damageBonus.value
        let damageEffect = ImmediateEffect.damage(damage)
        return .init(
            effects: [.immediate(target.id, damageEffect)],
            events: [.hit(damage)],
            skillUse: skillUse
        )
    }
    
    func hitBonus(source: Entity, weapon: WeaponInfo) -> (value: Int, usedSkills: SkillUse) {
        var result: Int = 0
        var skillUse = SkillUse()
        for (key, value) in weapon.hitBonuses {
            result += Int(Float(source.skills[key]) * value)
            skillUse.add(skill: key, amount: value)
        }
        return (result, skillUse)
    }
    
    func damageBonus(source: Entity, weapon: WeaponInfo) -> (value: Int, usedSkills: SkillUse) {
        var result: Int = 0
        var skillUse = SkillUse()
        for (key, value) in weapon.damageBonus {
            result += Int(Float(source.skills[key]) * value)
            skillUse.add(skill: key, amount: value)
        }
        return (result, skillUse)
    }
    
}
