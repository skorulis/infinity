//Created by Alexander Skorulis on 16/3/2024.

import Foundation

/// A coordinate referencing an exact spot on the map
struct ExactCoord: Hashable, Equatable, CustomDebugStringConvertible {
    let x: Int
    let y: Int
    
    static var zero: ExactCoord = .init(x: 0, y: 0)
    
    var debugDescription: String {
        "(\(x), \(y))"
    }
    
    var chunk: ChunkCoord {
        return ChunkCoord(x: x / MapConstants.chunkSize, y: y / MapConstants.chunkSize)
    }
}

/// A coordinate referncing a chunk
struct ChunkCoord: Hashable, Equatable {
    let x: Int
    let y: Int
    
    static var zero: ChunkCoord = .init(x: 0, y: 0)
    
    var debugDescription: String {
        "(\(x), \(y))"
    }
}
