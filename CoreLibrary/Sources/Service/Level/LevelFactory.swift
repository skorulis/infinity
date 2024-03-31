//Created by Alexander Skorulis on 16/3/2024.

import Foundation

struct LevelFactory {
    
    let mapFactory: MapFactory
    
    func make() -> LevelModel {
        var map = mapFactory.make()
        let player = Player()
        map.add(player: player)
        
        return LevelModel(map: map, player: player)
    }
}
