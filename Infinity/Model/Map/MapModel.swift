//Created by Alexander Skorulis on 11/3/2024.

import Foundation

struct MapModel {
    
    let xChunks: Int
    let yChunks: Int
    private(set) var chunks: [ChunkCoord: MapChunk] = [:]
    
    init(xChunks: Int, yChunks: Int) {
        self.xChunks = xChunks
        self.yChunks = yChunks
        for y in 0..<yChunks {
            for x in 0..<xChunks {
                let coord = ChunkCoord(x: x, y: y)
                chunks[coord] = .init(topCorner: coord)
            }
        }
    }
    
    func chunk(at: ChunkCoord) -> MapChunk {
        guard let chunk = chunks[at] else {
            fatalError("Chunk should have been pre created")
        }
        return chunk
    }
    
    func chunk(at: ExactCoord) -> MapChunk {
        return chunk(at: at.chunk)
    }
    
    mutating func add(player: Player) {
        let chunkCoord = player.coord.chunk
        var chunk = self.chunk(at: chunkCoord)
        chunk.squares[player.coord.y][player.coord.x].player = player
        chunks[chunkCoord] = chunk
    }
}
