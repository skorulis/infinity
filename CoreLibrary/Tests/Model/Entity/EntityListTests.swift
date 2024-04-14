//  Created by Alexander Skorulis on 14/4/2024.

@testable import CoreLibrary
import XCTest

final class EntityListTests: XCTestCase {
    
    private let entityFactory = EntityFactory(bodyPartFactory: .init())
    
    func testForEach() {
        var list = EntityList(entities: [entityFactory.human, entityFactory.human])
        
        XCTAssertEqual(list.list[0].gatheredSpeed, 0)
        XCTAssertEqual(list.list[1].gatheredSpeed, 0)
        list.forEach { $0.gatheredSpeed += 10 }
        XCTAssertEqual(list.list[0].gatheredSpeed, 10)
        XCTAssertEqual(list.list[1].gatheredSpeed, 10)
        
    }
    
}
