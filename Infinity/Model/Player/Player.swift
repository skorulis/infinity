//Created by Alexander Skorulis on 16/3/2024.

import Foundation

struct Player {
    let id: UUID = .init()
    var coord: ExactCoord = .init(x: 0, y: 0)
    
    let character: String = "@"
}
