// Created by Dhamova on 2023-04-20.

import SwiftUI

struct AddKeyView: View {
    @ObservedObject var viewModel: OpenAIKeyViewModel
    @State var key: String = ""

    var body: some View {
        HStack {
            TextField("open_api_key", text: $key)
                .onSubmit {
                    viewModel.updateKey(key)
                }
            Button {
                viewModel.updateKey(key)
            } label: {
                Text("add")
            }
            .disabled(key.isEmpty)
        }
        .padding()
    }
}

struct AddKeyView_Previews: PreviewProvider {
    static var previews: some View {
        AddKeyView(viewModel: OpenAIKeyViewModel())
    }
}
