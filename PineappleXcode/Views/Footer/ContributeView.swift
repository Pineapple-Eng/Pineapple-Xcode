// Created by Dhamova on 2023-04-20.

import SwiftUI

struct ContributeView: View {
    var body: some View {
        HStack {
            Button {
                print("open github")
            } label: {
                Label {
                    Text("open_source")
                } icon: {
                    Image("github.circle")
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
