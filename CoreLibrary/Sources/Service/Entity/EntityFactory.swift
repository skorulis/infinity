//  Created by Alexander Skorulis on 7/4/2024.

import Foundation

public final class EntityFactory {
    
    public init() {}
    
    public func rat(_ modifiers: [RaceModifier] = []) -> Entity {
        return .init(
            race: .rat,
            raceModifiers: modifiers,
            skills: .init(),
            biology: [
                .claws: .init(damage: 2...5),
                .teeth: .init(damage: 6...7)
            ],
            abilities: [
                .unarmed(.teeth),
                .unarmed(.claws)
            ]
        )
    }
    
    public var human: Entity {
        return .init(
            race: .human,
            skills: .init(),
            biology: [
                .hands: .init(damage: 1...4)
            ],
            abilities: [
                .unarmed(.hands)
            ]
        )
    }
}
