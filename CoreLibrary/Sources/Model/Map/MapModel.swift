//Created by Alexander Skorulis on 11/3/2024.

import Foundation

public struct MapModel {
    
    public let xChunks: Int
    public let yChunks: Int
    private(set) var chunks: [ChunkCoord: MapChunk] = [:]
    
    public init(xChunks: Int, yChunks: Int) {
        self.xChunks = xChunks
        self.yChunks = yChunks
        for y in 0..<yChunks {
            for x in 0..<xChunks {
                let coord = ChunkCoord(x: x, y: y)
                chunks[coord] = .init(topCorner: coord)
            }
        }
    }
    
    public func chunk(at: ChunkCoord) -> MapChunk {
        guard let chunk = chunks[at] else {
            fatalError("Chunk should have been pre created")
        }
        return chunk
    }
    
    func chunk(at: ExactCoord) -> MapChunk {
        return chunk(at: at.chunk)
    }
    
    public mutating func add(player: Player) {
        edit(coord: player.coord) { chunk in
            chunk.squares[player.coord.y][player.coord.x].player = player
        }
    }
    
    public mutating func edit(coord: ExactCoord, operation: (inout MapChunk) -> Void) {
        let chunkCoord = coord.chunk
        var chunk = self.chunk(at: chunkCoord)
        operation(&chunk)
        chunks[chunkCoord] = chunk
    }
    
    public mutating func move(player: inout Player, to: ExactCoord) {
        edit(coord: player.coord) { chunk in
            chunk.squares[player.coord.y][player.coord.x].player = nil
        }
        player.coord = to
        edit(coord: player.coord) { chunk in
            chunk.squares[player.coord.y][player.coord.x].player = player
        }
    }
}
