//  Created by Alexander Skorulis on 14/4/2024.

import Foundation

public struct ExperienceGain {
    
    let total: Float
    let skills: SkillUse
    
    var skillGains: [Skill: Float] {
        let totalUse = skills.totalUse
        var result: [Skill: Float] = [:]
        for (key, value) in skills.values {
            result[key] = total * value / totalUse
        }
        return result
    }
}
