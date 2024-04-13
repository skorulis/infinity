//  Created by Alexander Skorulis on 13/4/2024.

import CoreLibrary
import XCTest

final class EntityFactoryTests: XCTestCase {
    
    private let entityFactory = EntityFactory(bodyPartFactory: .init())
    
    func testHumanCreation() {
        let human = entityFactory.human
        
        XCTAssertEqual(human.health, 20)
    }
}
