//  Created by Alexander Skorulis on 12/4/2024.

import CoreLibrary
import XCTest

final class AttributesFormulasTests: XCTestCase {
    
    private let entityFactory = EntityFactory()
    
    func testDefaultHealth() {
        let skills = SkillValues(levels: [:])
        let atts = AttributeValues(values: [:])
        let health = AttributeFormulas.hitpoints(attributes: atts, skills: skills)
        XCTAssertEqual(health, 20)
    }
    
    func testRatHealth() {
        let rat = entityFactory.rat
        XCTAssertEqual(rat.derived[.maxHealth], 10)
        
    }
}
