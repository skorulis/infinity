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
        let entityMap = Dictionary(grouping: entities, by: {$0.id}).mapValues { $0[0]}
        
        return .init(entities: entityMap, runs: results)
    }
    
    public func simulate(entity1: Entity, entity2: Entity) -> SingleSimulationResult{
        var entities = [
            entity1.id: entity1,
            entity2.id: entity2
        ]
        var e1Stats = EntityStats()
        var e2Stats = EntityStats()
        let hasFinished: () -> Bool = {
            return entities.values.contains(where: { $0.health <= 0})
        }
        
        while !hasFinished() {
            let e1Result = abilityService.use(
                ability: .mainHandAttack,
                source: entities[entity1.id]!,
                target: entities[entity2.id]!
            )
            logStats(result: e1Result, stats: &e1Stats)
            
            entities = e1Result.entities
            if hasFinished() { continue }
            let e2Result = abilityService.use(
                ability: .mainHandAttack,
                source: entities[entity2.id]!,
                target: entities[entity1.id]!
            )
            
            logStats(result: e2Result, stats: &e2Stats)
            
            entities = e2Result.entities
        }
        
        return SingleSimulationResult(
            inputEntity1: entity1,
            inputEntity2: entity2,
            outputEntities: Array(entities.values),
            stats: [
                entity1.id: e1Stats,
                entity2.id: e2Stats
            ]
        )
    }
    
    private func logStats(result: AbilityUseResult, stats: inout EntityStats) {
        stats.attacks += 1
        for event in result.events {
            switch event {
            case .miss:
                stats.misses += 1
            case let .hit(damage):
                stats.damage += damage
            }   
        }
    }
    
}

public extension CombatSimulationService {
    struct SingleSimulationResult {
        public let inputEntity1: Entity
        public let inputEntity2: Entity
        
        public let outputEntities: [Entity]
        public let stats: [EntityID: EntityStats]
        
        public var winner: Entity? {
            return outputEntities.first(where: {$0.health > 0})
        }
    }
    
    struct EntityStats {
        var attacks: Int = 0
        var misses: Int = 0
        var damage: Int = 0
    }
    
    struct SimulationResult {
        let entities: [EntityID: Entity]
        let runs: [SingleSimulationResult]
        
        public func wins(id: EntityID) -> Int {
            return runs.filter { $0.winner?.id == id }.count
        }
        
        public func hitFraction(id: EntityID) -> Double {
            let attacks = runs.reduce(0) { partialResult, result in
                partialResult + result.stats[id]!.attacks
            }
            if attacks == 0 {
                return 0
            }
            
            let misses = runs.reduce(0) { partialResult, result in
                partialResult + result.stats[id]!.misses
            }
            
            let hits = attacks - misses
            return Double(hits) / Double(attacks)
        }
        
        public func printResult(id: EntityID) {
            let entity = entities[id]!
            let hitPercentage = Int(100 * hitFraction(id: id))
            let damage = runs.reduce(0) { partialResult, res in
                return partialResult + res.stats[id]!.damage
            }
            print("\(entity.name) wins: \(wins(id: id))")
            print("Hit percentage \(hitPercentage)")
            print("Damage: \(damage)")
        }
    }
}
