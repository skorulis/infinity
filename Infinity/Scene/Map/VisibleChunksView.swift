//Created by Alexander Skorulis on 16/3/2024.

import SwiftUI

// MARK: - Memory footprint

struct VisibleChunksView {
    
    let map: MapModel
    let offset: CGPoint
}

// MARK: - Rendering

extension VisibleChunksView: View {
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Text("\(proxy.size.width)")
                Text("\(proxy.size.height)")
            }
        }
        .border(Color.black)
    }
}

// MARK: - Previews

#Preview {
    let map = MapModel(xChunks: 4, yChunks: 4)
    let offset = CGPoint.zero
    return VisibleChunksView(
        map: map,
        offset: offset
    )
}

