//  Created by Alexander Skorulis on 11/3/2024.

import ASKCore
import SwiftUI

struct ContentView: View {
    
    @Environment(\.factory) private var factory
    
    var body: some View {
        MapView(viewModel: factory.resolve())
    }
}

#Preview {
    let ioc = IOC()
    return ContentView()
        .environment(\.factory, ioc)
}
