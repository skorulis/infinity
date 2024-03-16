//Created by Alexander Skorulis on 16/3/2024.

import Foundation

struct Coord: Hashable, Equatable, CustomDebugStringConvertible {
    let x: Int
    let y: Int
    
    static var zero: Coord = .init(x: 0, y: 0)
    
    var debugDescription: String {
        "(\(x), \(y))"
    }
}
