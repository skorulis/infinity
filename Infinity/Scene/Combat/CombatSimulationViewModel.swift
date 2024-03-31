//Created by Alexander Skorulis on 31/3/2024.

import CoreLibrary
import Foundation

final class CombatSimulationViewModel: ObservableObject {

    private let simulationService: CombatSimulationService
    
    init(simulationService: CombatSimulationService) {
        self.simulationService = simulationService
    }
    
}

extension CombatSimulationViewModel {
    
    func simulate() {
        let e1 = Entity(race: .human, skills: .init(levels: [.dexterity: 5]))
        let e2 = Entity(race: .rat)
        
        let result = simulationService.simulate(entities: [e1, e2], runs: 1000)
        
        result.printResult(id: e1.id)
        result.printResult(id: e2.id)
    }
}
