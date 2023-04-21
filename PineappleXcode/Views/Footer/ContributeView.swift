// Created by Dhamova on 2023-04-20.

import SwiftUI

struct ContributeView: View {
    @Environment(\.openURL) var openURL

    var body: some View {
        HStack {
            Button {
                openURL(URL(string: "https://github.com/Dhamova/Pineapple-Xcode")!)
            } label: {
                Label {
                    Text("open_source")
                } icon: {
                    Image("github.circle")
                }
            }
            .buttonStyle(SandiaButtonStyle(padding: 6.0))
            .controlSize(.small)
            Button {
                openURL(URL(string: "https://xcode.pineapple.build")!)
            } label: {
                Label {
                    Text("help")
                } icon: {
                    Image(systemName: "questionmark.circle.fill")
                }
            }
            .buttonStyle(SandiaButtonStyle(padding: 6.0))
            .controlSize(.small)
        }
        .padding()
    }
}

struct ContributeView_Previews: PreviewProvider {
    static var previews: some View {
        ContributeView()
    }
}
