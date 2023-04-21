// Created by Dhamova on 2023-04-20.

import SwiftUI

struct ConfigurationView: View {
    var body: some View {
        VStack {
            OpenAIKeyView()
        }
        .padding()
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
    }
}
