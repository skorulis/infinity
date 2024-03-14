//Created by Alexander Skorulis on 13/3/2024.

import SwiftUI

struct MapChunkView: View {
    
    let chunk: MapChunk
    
    var body: some View {
        Canvas { context, size in
            for y in 0..<MapConstants.chunkSize {
                for x in 0..<MapConstants.chunkSize {
                    let square = chunk.square(x: x, y: y)
                    //context.draw(Image("gold"), at: offset(x: x, y: y))
                    context.draw(
                        Text(square.character).font(FontName.mono.font(12)),
                        in: rect(x: x, y: y)
                    )
                }
            }
        }
        .frame(width: MapConstants.chunkViewSize, height: MapConstants.chunkViewSize)
    }
    
    private func offset(x: Int, y: Int) -> CGPoint {
        return .init(
            x: CGFloat(x) * MapConstants.tileSize + MapConstants.halfTileSize ,
            y: CGFloat(y) * MapConstants.tileSize + MapConstants.halfTileSize
        )
    }
    
    private func rect(x: Int, y: Int) -> CGRect {
        let origin = CGPoint(
            x: CGFloat(x) * MapConstants.tileSize,
            y: CGFloat(y) * MapConstants.tileSize
        )
        return CGRect(
            origin: origin,
            size: .init(
                width: MapConstants.tileSize,
                height: MapConstants.tileSize
            )
        )
    }
}

#Preview {
    MapChunkView(chunk: .init())
        .border(Color.black)
}
