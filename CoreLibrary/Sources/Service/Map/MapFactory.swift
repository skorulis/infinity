//Created by Alexander Skorulis on 16/3/2024.

import Foundation

public struct MapFactory {
    
    public init() {}
    
    public func make() -> MapModel {
        return .init(xChunks: 4, yChunks: 4)
    }
}
