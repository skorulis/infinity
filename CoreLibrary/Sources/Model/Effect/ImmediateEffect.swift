//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public enum ImmediateEffect: Equatable {
    case hit(EntityID)
    case miss(EntityID)
    case damage(_ amount: Int)
    case useSpeed(_ amount: Int)
}
