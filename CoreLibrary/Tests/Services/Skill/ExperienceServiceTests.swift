//  Created by Alexander Skorulis on 14/4/2024.

import CoreLibrary
import Foundation
import XCTest

final class ExperienceServiceTests: XCTestCase {
    
    private let entityFactory = EntityFactory(bodyPartFactory: .init())
    private let experienceService = ExperienceService()
    
    func testExperienceValues() {
        XCTAssertEqual(experienceService.experience(for: entityFactory.human), 1)
        
        XCTAssertEqual(experienceService.experience(for: entityFactory.rat()), 0.5)
        XCTAssertEqual(experienceService.experience(for: entityFactory.rat([.giant])), 0.75)
    }
    
    func testExperienceGain() {
        let e1 = entityFactory.human
        var e2 = entityFactory.human
        
        //XCTAssertEqual(experienceService.experience(for: e1, from: e2), 0)
        e2.health = e2.maxHealth / 2
        XCTAssertEqual(experienceService.experience(for: e1, from: e2), 0.25)
        e2.health = 0
        XCTAssertEqual(experienceService.experience(for: e1, from: e2), 1)
    }
}
