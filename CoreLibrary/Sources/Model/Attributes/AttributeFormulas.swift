//  Created by Alexander Skorulis on 12/4/2024.

import Foundation

public enum AttributeFormulas {
    
    public static func hitpoints(attributes: AttributeValues, skills: SkillValues) -> Int {
        var base = attributes.valueWithDefault(.baseHitPoints).value
        base += attributes.valueWithDefault(.hitPointGain).value * (skills[.toughness] - 1)
        return base
    }
    
    public static func derivedAttributes(
        attributes: AttributeValues,
        skills: SkillValues
    ) -> DerivedAttributeValues {
        let hitpoints = Self.hitpoints(attributes: attributes, skills: skills)
        
        return DerivedAttributeValues(
            values: [
                .maxHealth: hitpoints
            ]
        )
    }
}
