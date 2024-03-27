//Created by Alexander Skorulis on 27/3/2024.

import Foundation

public struct Entity {
    
    var skills: SkillValues = .init()
    var health: Health = .init(current: 50, max: 50)
}
