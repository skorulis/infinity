//Created by Alexander Skorulis on 16/3/2024.

import CoreLibrary
import Foundation
@testable import Infinity
import XCTest

final class InfinityTests: XCTestCase {
    
    func test_screen_conversion() {
        XCTAssertEqual(
            MapMath.toMapCoord(screen: .zero),
            .zero
        )
        
        XCTAssertEqual(
            MapMath.toMapCoord(screen: .init(x: 100, y: 150)),
            ExactCoord(x: 6, y: 9)
        )
        
    }
}
