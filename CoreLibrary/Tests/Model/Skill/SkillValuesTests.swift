//  Created by Alexander Skorulis on 13/4/2024.

import CoreLibrary
import XCTest

final class SkillValuesTests: XCTestCase {
    
    func testXPGain() {
        var skills = SkillValues(levels: [:])
        skills.add(xp: 10, skill: .dexterity)
        XCTAssertEqual(skills[.dexterity], 2)
        skills.add(xp: 15, skill: .dexterity)
        XCTAssertEqual(skills[.dexterity], 3)
        XCTAssertEqual(skills.xp(skill: .dexterity), 25)
    }
}
