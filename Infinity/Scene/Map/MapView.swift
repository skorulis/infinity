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
            Text("\(viewModel.totalOffset.width)")
                .offset(viewModel.totalOffset)
        }
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

