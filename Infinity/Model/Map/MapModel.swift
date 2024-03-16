//Created by Alexander Skorulis on 11/3/2024.

import Foundation

struct MapModel {
    
    var chunks: [Coord: MapChunk] = [:]
    
    init(xChunks: Int, yChunks: Int) {
        for y in 0..<yChunks {
            for x in 0..<xChunks {
                let coord = Coord(x: x, y: y)
                chunks[coord] = .init(topCorner: coord)
            }
        }
    }
    
    func chunk(at: Coord) -> MapChunk {
        guard let chunk = chunks[at] else {
            fatalError("Chunk should have been pre created")
        }
        return chunk
    }
}
