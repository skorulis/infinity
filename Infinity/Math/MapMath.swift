//Created by Alexander Skorulis on 16/3/2024.

import Foundation

enum MapMath {
    
    static func toMapCoord(screen: CGPoint) -> Coord {
        let x = Int(screen.x / MapConstants.tileSize)
        let y = Int(screen.y / MapConstants.tileSize)
        return Coord(x: x, y: y)
    }
    
    static func chunkOffset(coord: Coord) -> CGSize {
        return CGSize(
            width: CGFloat(coord.x * MapConstants.chunkSize) * MapConstants.tileSize,
            height: CGFloat(coord.y * MapConstants.chunkSize) * MapConstants.tileSize
        )
    }
}
