//  Created by Alexander Skorulis on 31/3/2024.

import Foundation

public final class CombatSimulationService {
    
    private let abilityService: AbilityService
    private let random: RandomService
    private let experienceService: ExperienceService
    
    public init(
        abilityService: AbilityService,
        random: RandomService,
        experienceService: ExperienceService
    ) {
        self.abilityService = abilityService
        self.random = random
        self.experienceService = experienceService
    }
    
    public func simulate(config: SimulationConfig) -> SimulationResult {
        var results: [SingleSimulationResult] = []
        for _ in 0..<config.runs {
            for first in 0..<config.entities.count {
                for second in 0..<config.entities.count {
                    if first != second {
                        let result = simulate(
                            entity1: config.entities[first],
                            entity2: config.entities[second]
                        )
                        results.append(result)
                    }
                }
            }
        }
        let entityMap = Dictionary(grouping: config.entities, by: {$0.id}).mapValues { $0[0]}
        
        return .init(entities: entityMap, runs: results, config: config)
    }
    
    public func simulate(entity1: Entity, entity2: Entity) -> SingleSimulationResult {
        var entityList = EntityList(entities: [entity1, entity2])
        var entityStats: [EntityID: EntityStats] = [
            entity1.id: EntityStats(),
            entity2.id: EntityStats(),
        ]
        let hasFinished: () -> Bool = {
            return entityList.list.contains(where: { $0.health <= 0})
        }
        
        while !hasFinished() {
            if let nextAttacker = nextToAttack(entities: entityList) {
                let target = entityList.other(id: nextAttacker.id)
                let result = attack(source: nextAttacker, target: target)
                var stats = entityStats[nextAttacker.id]!
                logStats(result: result, stats: &stats)
                entityStats[nextAttacker.id] = stats
                entityList.update(entities: result.entities)
            } else {
                entityList.forEach { entity in
                    entity.gatheredSpeed += 10
                }
            }
        }
        
        let e1Gain = experienceService.experience(for: entity1, from: entityList[entity2.id])
        let e2Gain = experienceService.experience(for: entity2, from: entityList[entity1.id])
        let e1Experience = ExperienceGain(total: e1Gain, skills: .init())
        let e2Experience = ExperienceGain(total: e2Gain, skills: .init())
        
        return SingleSimulationResult(
            inputEntity1: entity1,
            inputEntity2: entity2,
            outputEntities: entityList,
            stats: entityStats,
            xpGain: [
                entity1.id: e1Experience,
                entity2.id: e2Experience
            ]
        )
    }
    
    private func nextToAttack(entities: EntityList) -> Entity? {
        var best: Entity?
        var bestSpeed: Int = 0
        for entity in entities.list {
            if entity.gatheredSpeed > bestSpeed && entity.gatheredSpeed >= 10 {
                best = entity
                bestSpeed = entity.gatheredSpeed
            }
        }
        return best
    }
    
    private func attack(source: Entity, target: Entity) -> AbilityUseResult {
        let ability = pickAbility(entity: source)
        return abilityService.use(
            ability: ability,
            source: source,
            target: target
        )
    }
    
    private func pickAbility(entity: Entity) -> Ability {
        let index = random.int(range: 0...entity.abilities.count-1)
        let ability = entity.abilities[index]
        return ability
    }
    
    private func logStats(result: AbilityUseResult, stats: inout EntityStats) {
        stats.attacks += 1
        stats.abilities.append(result)
        for event in result.result.events {
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
        
        public let outputEntities: EntityList
        public let stats: [EntityID: EntityStats]
        public let xpGain: [EntityID: ExperienceGain]
        
        public var winner: Entity? {
            return outputEntities.list.first(where: {$0.health > 0})
        }
    }
    
    struct SimulationConfig {
        public let entities: [Entity]
        public let runs: Int
        public let printAllLogs: Bool
        
        public init(entities: [Entity], runs: Int, printAllLogs: Bool = false ) {
            self.entities = entities
            self.runs = runs
            self.printAllLogs = printAllLogs
        }
    }
    
    struct EntityStats {
        public var abilities: [AbilityUseResult] = []
        public var attacks: Int = 0
        public var misses: Int = 0
        public var damage: Int = 0
    }
    
    struct SimulationResult {
        public let entities: [EntityID: Entity]
        public let runs: [SingleSimulationResult]
        public let config: SimulationConfig
        
        public func wins(id: EntityID) -> Int {
            return runs.filter { $0.winner?.id == id }.count
        }
        
        public func xpGain(id: EntityID) -> Float {
            return runs.reduce(0) { partialResult, res in
                return partialResult + res.xpGain[id]!.total
            }
        }
        
        public func attacks(id: EntityID) -> Int {
            return runs.reduce(0) { partialResult, result in
                partialResult + result.stats[id]!.attacks
            }
        }
        
        public func hitFraction(id: EntityID) -> Double {
            let attacks = self.attacks(id: id)
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
            let xp = Int(xpGain(id: id))
            print("\(entity.name) wins: \(wins(id: id))")
            print("Attacks: \(self.attacks(id: id))")
            print("Hit percentage \(hitPercentage)")
            print("Damage: \(damage)")
            print("Experience: \(xp)")
        }
    }
}
