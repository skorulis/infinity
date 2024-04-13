//  Created by Alexander Skorulis on 13/4/2024.

import Foundation

public final class BodyPartFactory {
    
    public init() {}
    
    func humanoidHands(damage: ClosedRange<Int>) -> BodyPartDefinition {
        return .init(
            weapon: .init(
                damage: 1...4,
                hitBonuses: [
                    .strength: 1,
                    .dexterity: 1
                ],
                damageBonus: [
                    .strength: 0.2,
                    .dexterity: 0.2
                ]
            )
        )
    }
    
    func animalClaws(damage: ClosedRange<Int>) -> BodyPartDefinition {
        return .init(
            weapon: .init(
                damage: damage,
                hitBonuses: [
                    .strength: 1,
                    .dexterity: 1
                ],
                damageBonus: [
                    .strength: 0.2
                ]
            )
        )
    }
    
    func animalTeeth(damage: ClosedRange<Int>) -> BodyPartDefinition {
        return .init(
            weapon: .init(
                damage: damage,
                hitBonuses: [
                    .dexterity: 1
                ],
                damageBonus: [
                    .strength: 0.2
                ]
            )
        )
    }
    
}
