//  Created by Alexander Skorulis on 13/4/2024.

import Foundation

public final class BodyPartFactory {
    
    public init() {}
    
    func humanoidHands(damage: ClosedRange<Int>) -> BodyPartDefinition {
        return .init(weapon: .init(damage: 1...4))
    }
    
}
