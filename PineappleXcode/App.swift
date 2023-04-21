// Created by Dhamova on 2023-04-20.

import SwiftUI

@main
struct PineappleXcodeApp: App {
    var body: some Scene {
        MenuBarExtra("pineapple_for_xcode", image: "PineappleSymbol") {
            VStack {
                TopBarView()
                ContentView()
                ContributeView()
                FooterView()
            }
            .background(.ultraThickMaterial)
        }
        .menuBarExtraStyle(.window)
    }
}
