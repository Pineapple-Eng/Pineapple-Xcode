// Created by Dhamova on 2023-04-20.

import SwiftUI

@main
struct PineappleXcodeApp: App {
    init() {
        initPython()
    }

    var body: some Scene {
        MenuBarExtra("pineapple_for_xcode", image: "PineappleSymbol") {
            VStack {
                TopBarView()
                ContentView()
                ContributeView()
                FooterView()
            }
            .background(.ultraThickMaterial)
            .onAppear {
                helloPython()
            }
        }
        .menuBarExtraStyle(.window)
    }
}
