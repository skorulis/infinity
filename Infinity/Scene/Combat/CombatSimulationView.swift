//Created by Alexander Skorulis on 31/3/2024.

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct CombatSimulationView {
    @StateObject var viewModel: CombatSimulationViewModel
}

// MARK: - Rendering

extension CombatSimulationView: View {
    
    var body: some View {
        VStack {
            Button("Simulate", action: viewModel.simulate)
            Button("Simulate x 1000", action: viewModel.simulate1000)
        }
    }
}

// MARK: - Previews

#Preview {
    let ioc = IOC()
    return CombatSimulationView(viewModel: ioc.resolve())
}

