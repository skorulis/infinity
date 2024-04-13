//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public struct SkillValues {
    
    private var levels: [Skill: Int]
    private var experience: [Skill: Float]
    
    public init(levels: [Skill: Int] = [:]) {
        self.levels = levels
        self.experience = [:]
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
    
    public mutating func add(xp: Float, skill: Skill) {
        let result = self.xp(skill: skill) + xp
        let nextLevel = self[skill] + 1
        self.experience[skill] = result
        let needed = ExperienceTable.xp(level: nextLevel)
        if Int(result) >= needed {
            self.set(skill: skill, level: nextLevel)
        }
    }
    
    public subscript(skill: Skill) -> Int {
        return level(skill: skill)
    }
    
    public func xp(skill: Skill) -> Float {
        return self.experience[skill] ?? 0
    }
}
