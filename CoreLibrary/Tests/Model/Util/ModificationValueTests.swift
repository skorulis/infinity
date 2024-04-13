//  Created by Alexander Skorulis on 13/4/2024.

import CoreLibrary
import XCTest

final class ModificationValueTests: XCTestCase {
    
    func testValue() {
        XCTAssertEqual(ModificationValue(add: 5, multiply: 1).value, 5)
        XCTAssertEqual(ModificationValue(add: 10, multiply: 1.1).value, 11)
        XCTAssertEqual(ModificationValue(add: 8, multiply: 1.2).value, 10)
    }
    
    func testAddition() {
        let item = ModificationValue.add(5) + ModificationValue.multiply(1.1) + ModificationValue.add(5)
        XCTAssertEqual(item, .init(add: 10, multiply: 1.1))
        XCTAssertEqual(item.value, 11)
    }
    
    func testSubtraction() {
        let item = ModificationValue.add(10) + ModificationValue.add(-5) + ModificationValue.multiply(0.5)
        XCTAssertEqual(item, .init(add: 5, multiply: 0.5))
        XCTAssertEqual(item.value, 3)
    }
    
}
