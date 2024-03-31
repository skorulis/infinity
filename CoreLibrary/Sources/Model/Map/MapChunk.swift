//Created by Alexander Skorulis on 13/3/2024.

import Foundation

public struct MapChunk {
    
    public let topCorner: ChunkCoord
    public var squares: [[MapSquare]]
    
    public init(topCorner: ChunkCoord) {
        self.topCorner = topCorner
        let emptyRow = Array(repeating: MapSquare(), count: MapConstants.chunkSize)
        squares = Array(repeating: emptyRow, count: MapConstants.chunkSize)
    }
    
    public func square(x: Int, y: Int) -> MapSquare {
        return squares[y][x]
    }
    
}
