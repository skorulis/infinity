//  Created by Alexander Skorulis on 13/4/2024.

import CoreLibrary
import XCTest

final class EntityFactoryTests: XCTestCase {
    
    private let factory = EntityFactory()
    
    func testHumanCreation() {
        let human = factory.human
        
        XCTAssertEqual(human.health, 20)
    }
}
