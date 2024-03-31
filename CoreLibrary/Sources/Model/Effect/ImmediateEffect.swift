//Created by Alexander Skorulis on 27/3/2024.

import Foundation

enum ImmediateEffect: Equatable {
    case hit(EntityID)
    case miss(EntityID)
    case damage(_ amount: Int)
}