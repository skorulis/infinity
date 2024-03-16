//  Created by Alexander Skorulis on 11/3/2024.

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct MapView {
    
    @StateObject var viewModel: MapViewModel = MapViewModel()
}

// MARK: - Rendering

extension MapView: View {
    
    var body: some View {
        ZStack {
            background
            content
                .allowsHitTesting(false)
            MapChunkView(chunk: .init(topCorner: .zero))
                .allowsHitTesting(false)
                .offset(viewModel.totalOffset)
        }
        .onTapGesture { location in
            print(location)
        }
    }
    
    private var content: some View {
        MapChunkCanvas()
            .frame(width: 200, height: 200)
    }
    
    private var background: some View {
        Color.white
            .contentShape(Rectangle())
            .gesture(drag)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                viewModel.drag = gesture.translation
            }
            .onEnded { _ in
                viewModel.dragStart = viewModel.totalOffset
                viewModel.drag = .zero
            }
    }
}

// MARK: - Previews

#Preview {
    MapView()
}

