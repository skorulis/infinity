//  Created by Alexander Skorulis on 10/4/2024.

import Foundation

public enum Attribute {
    
    /// Hit points at level 1 constitution
    case baseHitPoints
    
    /// Hit points gained per level
    case hitPointGain
    
    var `default`: Int {
        switch self {
        case .baseHitPoints:
            return 20
        case .hitPointGain:
            return 5
        }
    }
}

public struct AttributeValues {
    
    let values: [Attribute: Int]
    
    public init(values: [Attribute : Int]) {
        self.values = values
    }
    
    public func value(_ attribute: Attribute) -> Int? {
        return values[attribute]
    }
    
    public func valueWithDefault(_ attribute: Attribute) -> Int {
        values[attribute] ?? attribute.default
    }
    
    static func +(lhs: AttributeValues, rhs: AttributeValues) -> AttributeValues {
        var mutableValues = lhs.values
        for (key, value) in rhs.values {
            mutableValues[key] = (mutableValues[key] ?? 0) + value
        }
        
        return .init(values: mutableValues)
    }
    
    subscript(attribute: Attribute) -> Int {
        return valueWithDefault(attribute)
    }
}
