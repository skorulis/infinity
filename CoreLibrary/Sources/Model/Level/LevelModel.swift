//Created by Alexander Skorulis on 16/3/2024.

import Foundation

struct LevelModel {
    var map: MapModel
    var player: Player
    
    init(map: MapModel, player: Player) {
        self.map = map
        self.player = player
    }
}
