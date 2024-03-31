//Created by Alexander Skorulis on 16/3/2024.

import Foundation

public enum MapMath {
    
    public static func toMapCoord(screen: CGPoint) -> ExactCoord {
        let x = Int(screen.x / MapConstants.tileSize)
        let y = Int(screen.y / MapConstants.tileSize)
        return ExactCoord(x: x, y: y)
    }
    
    public static func chunkOffset(coord: ChunkCoord) -> CGSize {
        return CGSize(
            width: CGFloat(coord.x * MapConstants.chunkSize) * MapConstants.tileSize,
            height: CGFloat(coord.y * MapConstants.chunkSize) * MapConstants.tileSize
        )
    }
}
