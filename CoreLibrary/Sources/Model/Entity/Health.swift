//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public struct Health {
    
    private(set) var current: Int
    var maxValue: Int
    
    init(current: Int, max: Int) {
        self.current = current
        self.maxValue = max
    }
    
    mutating func take(amount: Int) {
        precondition(amount >= 0)
        self.current = max(current - amount, 0)
    }
}
