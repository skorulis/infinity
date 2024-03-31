//  Created by Alexander Skorulis on 31/3/2024.

import Foundation

public enum DerivedAttribute {
    case maxHealth
}

public struct DerivedAttributeValues {
    
    let values: [DerivedAttribute: Int]
    
    public func value(_ attribute: DerivedAttribute) -> Int {
        return values[attribute] ?? 0
    }
    
    static func +(lhs: DerivedAttributeValues, rhs: DerivedAttributeValues) -> DerivedAttributeValues {
        var mutableValues = lhs.values
        for (key, value) in rhs.values {
            mutableValues[key] = (mutableValues[key] ?? 0) + value
        }
        
        return .init(values: mutableValues)
    }
    
}
