//  Created by Alexander Skorulis on 12/4/2024.

import CoreLibrary
import XCTest

final class AttributesFormulasTests: XCTestCase {
    
    private let entityFactory = EntityFactory(bodyPartFactory: .init())
    
    func testDefaultHealth() {
        let skills = SkillValues(levels: [:])
        let atts = AttributeValues(values: [:])
        let health = AttributeFormulas.hitpoints(attributes: atts, skills: skills)
        XCTAssertEqual(health, 20)
    }
    
    func testRatHealth() {
        var rat = entityFactory.rat()
        XCTAssertEqual(rat.derived[.maxHealth], 10)
        rat.skills.set(skill: .toughness, level: 2)
        XCTAssertEqual(rat.derived[.maxHealth], 11)
    }
    
    func testGiantRat() {
        var rat = entityFactory.rat([.giant])
        XCTAssertEqual(rat.derived[.maxHealth], 15)
        rat.skills.set(skill: .toughness, level: 2)
        XCTAssertEqual(rat.derived[.maxHealth], 17)
    }
}
