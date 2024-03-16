//Created by Alexander Skorulis on 16/3/2024.

import SwiftUI

// MARK: - Memory footprint

struct VisibleChunksView {
    
    let map: MapModel
    let offset: CGSize
}

// MARK: - Rendering

extension VisibleChunksView: View {
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .topLeading) {
                ForEach(Array(0..<map.yChunks), id: \.self) { y in
                    ForEach(Array(0..<map.xChunks), id: \.self) { x in
                        chunk(x: x, y: y)
                    }
                }
            }
        }
        .offset(offset)
        .border(Color.black)
    }
    
    private func chunk(x: Int, y: Int) -> some View {
        let coord = ChunkCoord(x: x, y: y)
        let chunk = map.chunk(at: coord)
        return MapChunkView(chunk: chunk)
            .border(Color.gray)
            .offset(MapMath.chunkOffset(coord: coord))
    }
}

// MARK: - Previews

#Preview {
    let map = MapModel(xChunks: 4, yChunks: 4)
    let offset = CGSize.zero
    return VisibleChunksView(
        map: map,
        offset: offset
    )
}

