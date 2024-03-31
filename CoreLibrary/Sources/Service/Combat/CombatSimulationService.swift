//  Created by Alexander Skorulis on 31/3/2024.

import Foundation

public final class CombatSimulationService {
    
    private let abilityService: AbilityService
    
    public init(abilityService: AbilityService) {
        self.abilityService = abilityService
    }
    
    public func simulate(entities: [Entity], runs: Int) -> SimulationResult {
        var results: [SingleSimulationResult] = []
        for _ in 0..<runs {
            for first in 0..<entities.count {
                for second in 0..<entities.count {
                    if first != second {
                        let result = simulate(entity1: entities[first], entity2: entities[second])
                        results.append(result)
                    }
                }
            }
        }
        
        return .init(runs: results)
    }
    
    public func simulate(entity1: Entity, entity2: Entity) -> SingleSimulationResult{
        var entities = [
            entity1.id: entity1,
            entity2.id: entity2
        ]
        let hasFinished: () -> Bool = {
            return entities.values.contains(where: { $0.health <= 0})
        }
        
        while !hasFinished() {
            let e1Result = abilityService.use(
                ability: .mainHandAttack,
                source: entities[entity1.id]!,
                target: entities[entity2.id]!
            )
            entities = e1Result.entities
            if hasFinished() { continue }
            let e2Result = abilityService.use(
                ability: .mainHandAttack,
                source: entities[entity2.id]!,
                target: entities[entity1.id]!
            )
            entities = e2Result.entities
        }
        
        return SingleSimulationResult(
            inputEntity1: entity1,
            inputEntity2: entity2,
            outputEntities: Array(entities.values)
        )
        
    }
    
}

public extension CombatSimulationService {
    struct SingleSimulationResult {
        public let inputEntity1: Entity
        public let inputEntity2: Entity
        
        public let outputEntities: [Entity]
        
        public var winner: Entity? {
            return outputEntities.first(where: {$0.health > 0})
        }
    }
    
    struct SimulationResult {
        let runs: [SingleSimulationResult]
        
        public func wins(id: EntityID) -> Int {
            return runs.filter { $0.winner?.id == id }.count
        }
    }
}
