//Created by Alexander Skorulis on 31/3/2024.

import CoreLibrary
import Foundation

final class CombatSimulationViewModel: ObservableObject {

    private let simulationService: CombatSimulationService
    private let entityFactory: EntityFactory
    
    init(simulationService: CombatSimulationService, entityFactory: EntityFactory) {
        self.simulationService = simulationService
        self.entityFactory = entityFactory
    }
    
}

extension CombatSimulationViewModel {
    
    func simulate() {
        let e1 = entityFactory.human
        let e2 = entityFactory.rat
        
        let config = CombatSimulationService.SimulationConfig(
            entities: [e1, e2],
            runs: 1,
            printAllLogs: true
        )
        let result = simulationService.simulate(config: config)
        printResult(result)
    }
    
    func simulate1000() {
        let e1 = entityFactory.human
        let e2 = entityFactory.rat
        
        let config = CombatSimulationService.SimulationConfig(
            entities: [e1, e2],
            runs: 1000,
            printAllLogs: false
        )
        let result = simulationService.simulate(config: config)
        printResult(result)
    }
    
    private func printResult(_ result: CombatSimulationService.SimulationResult) {
        print("---")
        for entity in result.config.entities {
            result.printResult(id: entity.id)
            if result.config.printAllLogs {
                for run in result.runs {
                    let stats = run.stats[entity.id]!
                    for abilityUse in stats.abilities {
                        print(abilityUse.ability)
                    }
                }
            }
            print("")
        }
        print("---\n")
    }
    
}
