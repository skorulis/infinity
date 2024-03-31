//Created by Alexander Skorulis on 16/3/2024.

import Foundation

/// A coordinate referencing an exact spot on the map
public struct ExactCoord: Hashable, Equatable, CustomDebugStringConvertible {
    public let x: Int
    public let y: Int
    
    public static var zero: ExactCoord = .init(x: 0, y: 0)
    
    public var debugDescription: String {
        "(\(x), \(y))"
    }
    
    public var chunk: ChunkCoord {
        return ChunkCoord(x: x / MapConstants.chunkSize, y: y / MapConstants.chunkSize)
    }
}

/// A coordinate referncing a chunk
public struct ChunkCoord: Hashable, Equatable {
    public let x: Int
    public let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public static var zero: ChunkCoord = .init(x: 0, y: 0)
    
    public var debugDescription: String {
        "(\(x), \(y))"
    }
}
