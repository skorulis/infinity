//  Created by Alexander Skorulis on 7/4/2024.

import Foundation

public struct BodyPartDefinition {
    
    let damage: ClosedRange<Int>?
    
    init(damage: ClosedRange<Int>?) {
        self.damage = damage
    }
}
