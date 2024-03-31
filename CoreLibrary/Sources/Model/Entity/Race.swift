//  Created by Alexander Skorulis on 31/3/2024.

import Foundation

public enum Race: String, Codable {
    
    case human
    case rat
}

extension Race {
    
    var derivedAttributes: DerivedAttributeValues {
        switch self {
        case .human:
            return .init(
                values: [
                    .maxHealth: 20
                ]
            )
        case .rat:
            return .init(
                values: [
                    .maxHealth: 10
                ]
            )
        }
    }
    
}
