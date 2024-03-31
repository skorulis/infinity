//  Created by Alexander Skorulis on 31/3/2024.

import Foundation

public enum MapConstants {
    
    // How many tiles in a chunk
    static let chunkSize: Int = 20
    
    /// Visual size of a tile
    static let tileSize: CGFloat = 16
    static let halfTileSize: CGFloat = tileSize / 2
    
    /// Visual size of a chunk
    static let chunkViewSize: CGFloat = tileSize * CGFloat(chunkSize)
}
