//Created by Alexander Skorulis on 16/3/2024.

import Foundation
@testable import Infinity
import XCTest

final class PathFinderTests: XCTestCase {
    
    private let mapFactory = MapFactory()
    
    func testPathCalculation() {
        let pathFinder = PathFinder()
        let map = mapFactory.make()
        
        let start = ExactCoord.zero
        let end = ExactCoord(x: 10, y: 10)
        let path = pathFinder.path(from: start, to: end, in: map)
        XCTAssertEqual(path.from, start)
        XCTAssertEqual(path.to, end)
        
        XCTAssertEqual(
            path.path,
            [
                .init(x: 0, y: 0),
                .init(x: 1, y: 1),
                .init(x: 2, y: 2),
                .init(x: 3, y: 3),
                .init(x: 4, y: 4),
                .init(x: 5, y: 5),
                .init(x: 6, y: 6),
                .init(x: 7, y: 7),
                .init(x: 8, y: 8),
                .init(x: 9, y: 9),
                .init(x: 10, y: 10),
            ]
        )
    }
    
}
