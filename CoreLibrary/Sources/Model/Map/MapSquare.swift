//Created by Alexander Skorulis on 11/3/2024.

import Foundation

public struct MapSquare {
    
    public var items: [String] = []
    
    public var player: Player?
    
    public var character: String {
        return player?.character ?? "░"
    }
    
}
