//Created by Alexander Skorulis on 16/3/2024.

import Foundation

public struct Player {
    public let id: UUID = .init()
    public var coord: ExactCoord = .init(x: 0, y: 0)
    
    public let character: String = "@"
}
