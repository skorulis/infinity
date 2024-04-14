//  Created by Alexander Skorulis on 13/4/2024.

import Foundation

public struct ModificationValue: Equatable {
    public let add: Int
    public let multiply: Float
    
    public init(add: Int, multiply: Float) {
        self.add = add
        self.multiply = multiply
    }
    
    public static func add(_ amount: Int) -> ModificationValue {
        return self.init(add: amount, multiply: 1)
    }
    
    public static func multiply(_ amount: Float) -> ModificationValue {
        return self.init(add: 0, multiply: amount)
    }
    
    public static let identify = ModificationValue(add: 0, multiply: 1)
    
    public var value: Int {
        return Int(round(floatValue))
    }
    
    public var floatValue: Float {
        Float(add) * multiply
    }
    
    public static func +(lhs: ModificationValue, rhs: ModificationValue) -> ModificationValue {
        return .init(add: lhs.add + rhs.add, multiply: lhs.multiply * rhs.multiply)
    }
}
