//Created by Alexander Skorulis on 11/3/2024.

import Foundation

struct MapSquare {
    
    var items: [String] = []
    
    var player: Player?
    
    var character: String {
        return player?.character ?? "░"
    }
    
}
