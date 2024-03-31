//Created by Alexander Skorulis on 13/3/2024.

import Foundation

struct MapChunk {
    
    let topCorner: ChunkCoord
    var squares: [[MapSquare]]
    
    init(topCorner: ChunkCoord) {
        self.topCorner = topCorner
        let emptyRow = Array(repeating: MapSquare(), count: MapConstants.chunkSize)
        squares = Array(repeating: emptyRow, count: MapConstants.chunkSize)
    }
    
    func square(x: Int, y: Int) -> MapSquare {
        return squares[y][x]
    }
    
}
