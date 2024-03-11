//Created by Alexander Skorulis on 11/3/2024.

import Foundation

final class MapViewModel: ObservableObject {
 
    @Published var dragStart: CGSize = .zero
    @Published var drag: CGSize = .zero
    
    var totalOffset: CGSize {
        return CGSize(
            width: drag.width + dragStart.width,
            height: drag.height + dragStart.height
        )
    }
}
