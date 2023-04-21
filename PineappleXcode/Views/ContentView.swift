// Created by Dhamova on 2023-04-20.

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ConfigurationView()
                .tabItem {
                    Label("configuration",
                          systemImage: "gear")
                }
            HelpView()
                .tabItem {
                    Label("help",
                          systemImage: "questionmark.circle")
                }
        }
        .padding(.horizontal)
        Divider()
            .padding([.top, .horizontal])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
