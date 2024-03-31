//  Created by Alexander Skorulis on 31/3/2024.

import Foundation

public extension ClosedRange<Int> {
    func move(distance: Int) -> ClosedRange<Int> {
        return (lowerBound + distance)...(upperBound + distance)
    }
}
