//  Created by Alexander Skorulis on 11/3/2024.

import ASKCore
import CoreLibrary
import SwiftUI

struct ContentView: View {
    
    @Environment(\.factory) private var factory
    
    var body: some View {
        CombatSimulationView(viewModel: factory.resolve())
        //MapView(viewModel: factory.resolve())
    }
}

#Preview {
    let ioc = IOC()
    return ContentView()
        .environment(\.factory, ioc)
}
