//Created by Alexander Skorulis on 11/3/2024.

import Foundation
import SwiftUI

struct MapChunkCanvas: View {
    
    
    var body: some View {
        Canvas { context, size in
            context.stroke(
                    Path(ellipseIn: CGRect(origin: .zero, size: size)),
                    with: .color(.green),
                    lineWidth: 4)
        }
    }
}
