//Created by Alexander Skorulis on 16/3/2024.

import Foundation

public struct LevelModel {
    public var map: MapModel
    public var player: Player
    
    public init(map: MapModel, player: Player) {
        self.map = map
        self.player = player
    }
}
