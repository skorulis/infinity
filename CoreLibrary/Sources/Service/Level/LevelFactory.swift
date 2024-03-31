//Created by Alexander Skorulis on 16/3/2024.

import Foundation

public struct LevelFactory {
    
    public let mapFactory: MapFactory
    
    public init(mapFactory: MapFactory) {
        self.mapFactory = mapFactory
    }
    
    public func make() -> LevelModel {
        var map = mapFactory.make()
        let player = Player()
        map.add(player: player)
        
        return LevelModel(map: map, player: player)
    }
}
