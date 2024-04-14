//  Created by Alexander Skorulis on 13/4/2024.

import Foundation

struct SkillUse: Equatable {
    var values: [Skill: Float] = [:]
    
    mutating func add(skill: Skill, amount: Float) {
        values[skill] = self[skill] + amount
    }
    
    subscript(skill: Skill) -> Float {
        values[skill] ?? 0
    }
    
    static func += (left: inout SkillUse, right: SkillUse) {
        for (key, value) in right.values {
            left.values[key] = left[key] + value
        }
    }
    
    var totalUse: Float {
        return values.reduce(0) { partialResult, kv in
            return partialResult + kv.value
        }
    }
}
