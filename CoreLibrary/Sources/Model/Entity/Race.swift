//  Created by Alexander Skorulis on 31/3/2024.

import Foundation

public enum Race: String, Codable {
    
    case human
    case rat
}

extension Race {
    
    var attributes: AttributeValues {
        switch self {
        case .human:
            return .init(
                values: [:]
            )
        case .rat:
            return .init(
                values: [
                    .baseHitPoints: .add(-10),
                    .hitPointGain: .add(-4),
                    .xpGainMultiplier: .multiply(0.5)
                ]
            )
        }
    }
    
}
