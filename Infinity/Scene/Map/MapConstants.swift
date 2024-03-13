//Created by Alexander Skorulis on 13/3/2024.

import Foundation

enum MapConstants {
    static let tileSize: CGFloat = 16
    static let chunkSize: Int = 20
    
    static let chunkViewSize: CGFloat = tileSize * CGFloat(chunkSize)
    static let halfTileSize: CGFloat = tileSize / 2
}
