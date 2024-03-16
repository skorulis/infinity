//Created by Alexander Skorulis on 11/3/2024.

import Foundation

final class MapViewModel: ObservableObject {
 
    @Published var dragStart: CGSize = .zero
    @Published var drag: CGSize = .zero
    
    @Published var map: MapModel
    
    init(levelFactory: LevelFactory) {
        let level = levelFactory.make()
        self.map = level.map
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
        print("Coord = \(coord)")
    }
}
