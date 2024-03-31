//Created by Alexander Skorulis on 11/3/2024.

import Foundation
import CoreLibrary

final class MapViewModel: ObservableObject {
 
    @Published var dragStart: CGSize = .zero
    @Published var drag: CGSize = .zero
    
    @Published var map: MapModel
    @Published var player: Player
    
    private let pathFinder: PathFinder
    
    init(levelFactory: LevelFactory, pathFinder: PathFinder) {
        let level = levelFactory.make()
        self.map = level.map
        self.player = level.player
        self.pathFinder = pathFinder
    }
    
    var totalOffset: CGSize {
        return CGSize(
            width: drag.width + dragStart.width,
            height: drag.height + dragStart.height
        )
    }
    
    func onTap(location: CGPoint) {
        let offSetLocation = CGPoint(x: location.x - totalOffset.width, y: location.y - totalOffset.height)
        let coord = MapMath.toMapCoord(screen: offSetLocation)
        
        if player.coord == coord {
            return
        }
        
        let path = pathFinder.path(from: player.coord, to: coord, in: map)
        guard path.path.count > 1 else {
            return
        }
        
        map.move(player: &player, to: path.path[1])
    }
}
