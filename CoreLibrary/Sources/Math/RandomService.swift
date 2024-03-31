//Created by Alexander Skorulis on 30/3/2024.

import Foundation

protocol RandomService {
    
    /// A random number between the 2 numbers (inclusive)
    func int(from: Int, to: Int) -> Int
}

extension RandomService {
    func int(range: ClosedRange<Int>) -> Int {
        return int(from: range.lowerBound, to: range.upperBound)
    }
}

final class DefaultRandomService: RandomService {
    func int(from: Int, to: Int) -> Int {
        return Int.random(in: from...to)
    }
}

/// Always gives either the maximum or minimum value
final class FakeRandomService: RandomService {
    
    var strategy: Strategy = .mid
    var nextInts: [Int] = []
    
    func int(from: Int, to: Int) -> Int {
        if !nextInts.isEmpty {
            return nextInts.removeFirst()
        }
        switch strategy {
        case .min:
            return from
        case .max:
            return to
        case .mid:
            return (from + to) / 2
        }
    }
    
    enum Strategy {
        case min
        case max
        case mid
    }
    
}
