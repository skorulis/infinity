//  Created by Alexander Skorulis on 10/4/2024.

import Foundation

public enum Attribute: CaseIterable {
    
    /// Hit points at level 1 constitution
    case baseHitPoints
    
    /// Hit points gained per level
    case hitPointGain
    
    var `default`: ModificationValue {
        switch self {
        case .baseHitPoints:
            return .add(20)
        case .hitPointGain:
            return .add(5)
        }
    }
}

public struct AttributeValues {
    
    let values: [Attribute: ModificationValue]
    
    public init(values: [Attribute : ModificationValue]) {
        self.values = values
    }
    
    public func value(_ attribute: Attribute) -> ModificationValue? {
        return values[attribute]
    }
    
    public func valueWithDefault(_ attribute: Attribute) -> ModificationValue {
        values[attribute] ?? attribute.default
    }
    
    static func +(lhs: AttributeValues, rhs: AttributeValues) -> AttributeValues {
        var mutableValues = lhs.values
        for (key, value) in rhs.values {
            mutableValues[key] = (mutableValues[key] ?? .identify) + value
        }
        
        return .init(values: mutableValues)
    }
    
    subscript(attribute: Attribute) -> ModificationValue {
        return valueWithDefault(attribute)
    }
    
    public static let `default`: AttributeValues = {
        var dict = [Attribute: ModificationValue]()
        for att in Attribute.allCases {
            dict[att] = att.default
        }
        return .init(values: dict)
    }()
}
