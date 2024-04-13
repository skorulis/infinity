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
                values: [
                    .baseHitPoints: 20,
                    .hitPointGain: 4
                ]
            )
        case .rat:
            return .init(
                values: [
                    .baseHitPoints: 10,
                    .hitPointGain: 1
                ]
            )
        }
    }
    
}
