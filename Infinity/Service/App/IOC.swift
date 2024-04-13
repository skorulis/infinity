//Created by Alexander Skorulis on 16/3/2024.

import CoreLibrary
import ASKCore
import Foundation
import Swinject
import SwinjectAutoregistration

public final class IOC: IOCService {
 
    public override init(purpose: IOCPurpose = .testing) {
        super.init(purpose: purpose)
        
        registerServices(purpose: purpose)
        registerViewModels()
    }
    
    private func registerServices(purpose: IOCPurpose) {
        container.autoregister(MapFactory.self, initializer: MapFactory.init)
        container.autoregister(LevelFactory.self, initializer: LevelFactory.init)
        container.autoregister(PathFinder.self, initializer: PathFinder.init)
        container.autoregister(AbilityService.self, initializer: AbilityService.init)
        container.autoregister(CombatSimulationService.self, initializer: CombatSimulationService.init)
        
        container.autoregister(RandomService.self, initializer: DefaultRandomService.init)
        container.autoregister(EntityFactory.self, initializer: EntityFactory.init)
        container.autoregister(BodyPartFactory.self, initializer: BodyPartFactory.init)
        container.autoregister(ExperienceService.self, initializer: ExperienceService.init)
    }
    
    private func registerViewModels() {
        container.autoregister(MapViewModel.self, initializer: MapViewModel.init)
        container.autoregister(CombatSimulationViewModel.self, initializer: CombatSimulationViewModel.init)
    }
}
