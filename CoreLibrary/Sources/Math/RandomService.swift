//Created by Alexander Skorulis on 30/3/2024.

import Foundation

public protocol RandomService {
    
    /// A random number between the 2 numbers (inclusive)
    func int(from: Int, to: Int) -> Int
}

public extension RandomService {
    func int(range: ClosedRange<Int>) -> Int {
        return int(from: range.lowerBound, to: range.upperBound)
    }
}

public final class DefaultRandomService: RandomService {
    public func int(from: Int, to: Int) -> Int {
        return Int.random(in: from...to)
    }
    
    public init() {}
}

/// Always gives either the maximum or minimum value
public final class FakeRandomService: RandomService {
    
    public var strategy: Strategy = .mid
    public var nextInts: [Int] = []
    
    public func int(from: Int, to: Int) -> Int {
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
    
    public enum Strategy {
        case min
        case max
        case mid
    }
    
}
