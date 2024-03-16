//  Created by Alexander Skorulis on 11/3/2024.

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct MapView {
    
    @StateObject var viewModel: MapViewModel
}

// MARK: - Rendering

extension MapView: View {
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            background
            VisibleChunksView(
                map: viewModel.map,
                offset: viewModel.totalOffset
            )
            .allowsHitTesting(false)
        }
        .onTapGesture { viewModel.onTap(location: $0) }
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
    let ioc = IOC()
    return MapView(viewModel: ioc.resolve())
}

