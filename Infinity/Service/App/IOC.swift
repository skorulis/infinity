//Created by Alexander Skorulis on 16/3/2024.

import CoreLibrary
import ASKCore
import Foundation
import Swinject
import SwinjectAutoregistration

public final class IOC: IOCService {
 
    public override init(purpose: IOCPurpose = .testing) {
        super.init(purpose: purpose)
        
        registerServices()
        registerViewModels()
    }
    
    private func registerServices() {
        container.autoregister(MapFactory.self, initializer: MapFactory.init)
        container.autoregister(LevelFactory.self, initializer: LevelFactory.init)
        container.autoregister(PathFinder.self, initializer: PathFinder.init)
    }
    
    private func registerViewModels() {
        container.autoregister(MapViewModel.self, initializer: MapViewModel.init)
    }
}
