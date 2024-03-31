//Created by Alexander Skorulis on 16/3/2024.

import Foundation

struct PathFinder {
    
    func path(from: ExactCoord, to: ExactCoord, in map: MapModel) -> MapPath {
        let path = map.findPath(from: from, to: to)
        
        return MapPath(
            from: from,
            to: to,
            path: path
        )
    }
    
}

extension MapModel: Graph {
    typealias Node = ExactCoord
    
    func nodesAdjacent(to node: ExactCoord) -> Set<ExactCoord> {
        var result = Set<ExactCoord>()
        for y in -1...1 {
            for x in -1...1 {
                guard x != 0 || y != 0  else { continue }
                let posX = node.x + x
                let posY = node.y + y
                if posX < 0 || posY < 0 {
                    continue
                }
                result.insert(.init(x: posX, y: posY))
            }
        }
        return result
    }
    
    func estimatedCost(from start: ExactCoord, to end: ExactCoord) -> Float {
        let xDiff = abs(start.x - end.x)
        let yDiff = abs(start.y - end.y)
        return Float(xDiff + yDiff)
    }
    
    func cost(from start: ExactCoord, to end: ExactCoord) -> Float {
        let xDiff = abs(start.x - end.x)
        let yDiff = abs(start.y - end.y)
        let result = Float(xDiff + yDiff)
        return result
    }
    
}
