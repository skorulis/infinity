//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public struct SkillValues {
    
    private var levels: [Skill: Int]
    
    public init(levels: [Skill: Int] = [:]) {
        self.levels = levels
    }
    
    func level(skill: Skill) -> Int {
        return levels[skill] ?? 1
    }
    
    var maxLevel: Int {
        return levels.reduce(1) { partialResult, next in
            return max(partialResult, next.value)
        }
    }
    
    public mutating func set(skill: Skill, level: Int) {
        self.levels[skill] = level
    }
    
    public subscript(skill: Skill) -> Int {
        return level(skill: skill)
    }
}
