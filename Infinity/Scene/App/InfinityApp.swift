//  Created by Alexander Skorulis on 11/3/2024.

import ASKCore
import CoreLibrary
import SwiftUI

@main
struct InfinityApp: App {
    
    private let ioc = IOC(purpose: .normal)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.factory, ioc)
        }
    }
}
