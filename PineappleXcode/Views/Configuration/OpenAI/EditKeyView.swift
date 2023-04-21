// Created by Dhamova on 2023-04-20.

import SwiftUI

struct EditKeyView: View {
    @ObservedObject var viewModel: OpenAIKeyViewModel

    var body: some View {
        HStack {
            Text("****************")
            Button {
                viewModel.deleteKey()
            } label: {
                Text("delete")
                    .foregroundColor(.red)
            }
        }
    }
}

struct EditKeyView_Previews: PreviewProvider {
    static var previews: some View {
        EditKeyView(viewModel: OpenAIKeyViewModel())
    }
}
