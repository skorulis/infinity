//Created by Alexander Skorulis on 16/3/2024.

import Foundation

struct MapFactory {
    
    func make() -> MapModel {
        return .init(xChunks: 4, yChunks: 4)
    }
}
