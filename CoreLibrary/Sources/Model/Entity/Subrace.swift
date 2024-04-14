//  Created by Alexander Skorulis on 13/4/2024.

import Foundation

public enum RaceModifier {
    case giant
    
    var attributes: AttributeValues {
        switch self {
        case .giant:
            return .init(
                values: [
                    .baseHitPoints: .multiply(1.5),
                    .hitPointGain: .multiply(1.5),
                    .xpMultiplier: .multiply(1.5),
                ]
            )
        }
    }
}
