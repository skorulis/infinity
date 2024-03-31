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
}
