//  Created by Alexander Skorulis on 31/3/2024.

import Foundation

public enum Event: Equatable {
    case hit(_ damage: Int)
    case miss
}
